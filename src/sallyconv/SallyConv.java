package sallyconv;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

public class SallyConv {

	private String int2hex(Integer i) {
		return String.format("%04x", i);
	}

	private String getLabel(int org, String s) {
		return "l" + int2hex(org + Integer.parseInt(s, 16));
	}

	public SallyConv(String[] args) {

		try {
			BufferedReader fin = new BufferedReader(new FileReader(args[0]));
			BufferedWriter fout = new BufferedWriter(new FileWriter(args[1]));

			String line;
			String outline;
			String[] tokens;
			String[] jmp;
			int org = 0x0100;
			int address = org;
			String label;

			ArrayList<String> labels = new ArrayList<String>();
			ArrayList<String> source = new ArrayList<String>();

			source.add("l0100:\t\tORG\t00100h");

			for (;;) {
				line = fin.readLine();
				if (line == null)
					break;
				tokens = line.split("\\s+");
				for (String token : tokens) {
					System.out.print(token + " ");
				}
				System.out.println();

				// System.out.println(line);
				if (line.startsWith(";") || line.length() < 2) { // comments are passed through
					outline = line;
					source.add(line);
					continue;
				}
				if (tokens.length > 5 && tokens[tokens.length - 1].startsWith("(")) {

					// do lines with (+0ah)

					jmp = tokens[3].split(",");
					if (!tokens[3].contains(",")) {
						label = getLabel(org, tokens[3].substring(1, 4));

						outline = getLabel(0, int2hex(address)) + ":\t\t" + tokens[2] + "\t" + label + "\t\t; "
								+ tokens[tokens.length - 1];
					} else {
						label = getLabel(org, jmp[1].substring(1, 4));

						outline = getLabel(0, int2hex(address)) + ":\t\t" + tokens[2] + "\t" + jmp[0] + "," + label
								+ "\t\t; " + tokens[tokens.length - 1];
					}
					labels.add(label);

				} else {
					outline = getLabel(0, int2hex(address)) + ":\t";
					for (int i = 2; i < tokens.length; i++) {
						outline = outline + "\t" + tokens[i];
					}
				}

				if (tokens.length >= 2) {
					address += tokens[1].length() >> 1;
				}
				source.add(outline);

			}

			for (String s : source) {

				if (!s.startsWith(";") && s.length() > 5) {
					label = getLabel(0, s.substring(1, 5));

					if (!labels.contains(label)) {
						s = "     " + s.substring(6);
					}
				}

				System.out.println(s);
				fout.write(s + "\n");
			}

			for (String l : labels) {
				System.out.println(l);
			}

			fin.close();
			fout.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		new SallyConv(args);
	}

}
