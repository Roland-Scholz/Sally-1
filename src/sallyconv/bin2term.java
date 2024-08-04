package sallyconv;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class bin2term {

	public bin2term(String[] args) {
		try {
			BufferedReader fin = new BufferedReader(new FileReader(args[0]));
			BufferedWriter fout = new BufferedWriter(new FileWriter(args[1]));
			String line;
			int address;
			int count;
			int type;
			int index;

			for (;;) {
				line = fin.readLine();
				if (line == null)
					break;

				System.out.println(line);
				// System.out.println(line.substring(1, 3));
				// System.out.println(line.substring(3, 7));
				// System.out.println(line.substring(7, 9));

				count = Integer.parseInt(line.substring(1, 3), 16);
				address = Integer.parseInt(line.substring(3, 7), 16);
				type = Integer.parseInt(line.substring(7, 9), 16);

				if (type != 0)
					break;
				for (int i = 0; i < count; i++) {
					index = 9 + (i << 1);
					// System.out.print(line.substring(index, index + 2) + " ");
					fout.write("n" + String.format("%04x", address).toUpperCase() + "\n");
					fout.write("                                                         \n");
					fout.write("c" + line.substring(index, index + 2) + "\n");
					fout.write("                                                         \n");
					address++;
				}
				// System.out.println();
			}

			fin.close();
			fout.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		new bin2term(args);
	}
}
