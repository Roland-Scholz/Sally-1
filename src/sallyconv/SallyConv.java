package sallyconv;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class SallyConv {

	public SallyConv(String[] args) {

		try {
			BufferedReader fin = new BufferedReader(new FileReader(args[0]));
			BufferedWriter fout = new BufferedWriter(new FileWriter(args[1]));

			String line;
			String outline;
			String[] tokens;
			String[] jmp;
			String offset;
			int ioff;
			String op;

			for (;;) {
				line = fin.readLine();
				if (line == null)
					break;
				tokens = line.split("\\s+");
				System.out.println(line);
				if (line.startsWith(";"))
					outline = line;
				else

				if (tokens.length > 5 && tokens[tokens.length - 1].startsWith("(")) {
					offset = tokens[1].substring(2);
					ioff = Integer.parseInt(offset, 16);
					op = "+ ";
					if (ioff >= 128) {
						op = "- ";
						ioff = 256 - ioff;
					}

					jmp = tokens[3].split(",");
					offset = "ASMPC + 2 " + op + ioff;
					System.out.println(tokens[3]);
					if (!tokens[3].contains(",")) {
						outline = "\t\t" + tokens[2] + "\t" + offset + "\t\t; " + tokens[tokens.length - 1];
					} else {
						outline = "\t\t" + tokens[2] + "\t" + jmp[0] + "," + offset + "\t\t; "
								+ tokens[tokens.length - 1];
					}
				} else {
					outline = "\t";
					for (int i = 2; i < tokens.length; i++) {
						outline = outline + "\t" + tokens[i];
					}
				}
				fout.write(outline + "\n");
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
