import java.util.Scanner;

import entities.UniversalMachine;

public class Run {

	/* Decryption key for codex.umz :
	 *
	 * (\b.bb)(\v.vv)06FHPVboundvarHRAk
	 *
	 */
	public static void main(String[] args) {
		UniversalMachine um;
		boolean run = true;
		Scanner sc_le_classique = new Scanner(System.in);


		if (args.length != 1) {
			System.out.println("Error need at least 1 argument");
			System.out.println(" path/to/filename.umz");
			System.exit(1);
		}

		System.out.println("MIT License Copyright 2017 William Sergeant");
		do {
			System.out.println("=================================");
			System.out.println("|       UNIVERSAL MACHINE       |");
			System.out.println("=================================");
			System.out.println("| Menu:                         |");
			System.out.println("|        1. Load .umz file      |");
			System.out.println("|        2. Specifications 	|");
			System.out.println("|        3. Sandmark benchmark	|");
			System.out.println("|        4. Exit                |");
			System.out.println("=================================");

			switch(sc_le_classique.nextInt()) {
			case 1:
				um = new UniversalMachine(args[0]);
				um.run();
				break;
			case 3:
				long startTime = System.currentTimeMillis();
				um = new UniversalMachine("/users/Etu9/3200849/workspace/MSTL/CA/Universal_Machine/Universal_Machine/sandmark.umz");
				um.run();
				long duration = System.currentTimeMillis() - startTime;
				System.out.println("Execution duration : " + duration +" ms");
				break;
			case 4:
				sc_le_classique.close();
				System.out.println("Bye");
				run = false;
				System.exit(0);
			case 2:
				System.out.println("\n" +
						"  Order for Construction          Standard Sand of Pennsylvania Co.\n" +
						"\n" +
						"  Client: Cult of the Bound Variable\n" +
						"  Object: UM-32 \"Universal Machine\"\n" +
						"  -----------------------------------------------------------------\n" +
						"                                                      21 July 19106\n" +
						"\n" +
						"  Physical Specifications.\n" +
						"  ------------------------\n" +
						"\n" +
						"  The machine shall consist of the following components:\n" +
						"\n" +
						"    * An infinite supply of sandstone platters, with room on each\n" +
						"      for thirty-two small marks, which we call \"bits.\"\n" +
						"\n" +
						"                           least meaningful bit\n" +
						"                                              |\n" +
						"                                              v\n" +
						"              .--------------------------------.\n" +
						"              |VUTSRQPONMLKJIHGFEDCBA9876543210|\n" +
						"              `--------------------------------'\n" +
						"               ^\n" +
						"               |\n" +
						"               most meaningful bit\n" +
						"\n" +
						"              Figure 0. Platters\n" +
						"\n" +
						"      Each bit may be the 0 bit or the 1 bit. Using the system of\n" +
						"      \"unsigned 32-bit numbers\" (see patent #4,294,967,295) the\n" +
						"      markings on these platters may also denote numbers.\n" +
						"\n" +
						"    * Eight distinct general-purpose registers, capable of holding one\n" +
						"      platter each.\n" +
						"\n" + 
						"    * A collection of arrays of platters, each referenced by a distinct\n" +
						"      32-bit identifier. One distinguished array is referenced by 0\n" +
						"      and stores the \"program.\" This array will be referred to as the\n" +
						"      '0' array.\n" +
						"\n" +
						"    * A 1x1 character resolution console capable of displaying glyphs\n" +
						"      from the \"ASCII character set\" (see patent #127) and performing\n" +
						"      input and output of \"unsigned 8-bit characters\" (see patent\n" +
						"      #255).\n" +
						"\n" +
						"\n" +
						"  Behavior.\n" +
						"  ---------\n" +
						"\n" +
						"  The machine shall be initialized with a '0' array whose contents\n" +
						"  shall be read from a \"program\" scroll. All registers shall be\n" +
						"  initialized with platters of value '0'. The execution finger shall\n" +
						"  point to the first platter of the '0' array, which has offset zero.\n" +
						"\n" +
						"  When reading programs from legacy \"unsigned 8-bit character\"\n" +
						"  scrolls, a series of four bytes A,B,C,D should be interpreted with\n" +
						"  'A' as the most magnificent byte, and 'D' as the most shoddy, with\n" +
						"  'B' and 'C' considered lovely and mediocre respectively.\n" +
						"\n" +
						"  Once initialized, the machine begins its Spin Cycle. In each cycle\n" +
						"  of the Universal Machine, an Operator shall be retrieved from the\n" +
						"  platter that is indicated by the execution finger. The sections\n" +
						"  below describe the operators that may obtain. Before this operator\n" +
						"  is discharged, the execution finger shall be advanced to the next\n" +
						"  platter, if any.\n" +
						"\n" +
						"  Operators.\n" +
						"  ----------\n" +
						"\n" +
						"  The Universal Machine may produce 14 Operators. The number of the\n" +
						"  operator is described by the most meaningful four bits of the\n" +
						"  instruction platter.\n" +
						"\n" +
						"              .--------------------------------.\n" +
						"              |VUTSRQPONMLKJIHGFEDCBA9876543210|\n" +
						"              `--------------------------------'\n" +
						"               ^^^^\n" +
						"               |\n" +
						"               operator number\n" +
						"\n" +
						"              Figure 1. Operator Description\n" +
						"\n" +
						"\n" +
						"  Standard Operators.\n" +
						"  -------------------\n" +
						"\n" +
						"  Each Standard Operator performs an errand using three registers,\n" +
						"  called A, B, and C. Each register is described by a three bit\n" +
						"  segment of the instruction platter. The register C is described by\n" +
						"  the three least meaningful bits, the register B by the three next\n" +
						"  more meaningful than those, and the register A by the three next\n" +
						"  more meaningful than those.\n" +
						"\n" +
						"                                      A     C\n" +
						"                                      |     |\n" +
						"                                      vvv   vvv\n" +
						"              .--------------------------------.\n" +
						"              |VUTSRQPONMLKJIHGFEDCBA9876543210|\n" +
						"              `--------------------------------'\n" +
						"               ^^^^                      ^^^\n" +
						"               |                         |\n" +
						"               operator number           B\n" +
						"\n" +
						"              Figure 2. Standard Operators\n" +
						"\n" +
						"\n" +
						"  A description of each basic Operator follows.\n" +
						"\n" +
						"  Operator #0. Conditional Move.\n" +
						"\n" +
						"                  The register A receives the value in register B,\n" +
						"                  unless the register C contains 0.\n" +
						"\n" +
						"           #1. Array Index.\n" +
						"\n" +
						"                  The register A receives the value stored at offset\n" +
						"                  in register C in the array identified by B.\n" +
						"\n" +
						"           #2. Array Amendment.\n" +
						"\n" +
						"                  The array identified by A is amended at the offset\n" +
						"                  in register B to store the value in register C.\n" +
						"\n" +
						"           #3. Addition.\n" +
						"\n" +
						"                  The register A receives the value in register B plus\n" +
						"                  the value in register C, modulo 2^32.\n" +
						"\n" +
						"           #4. Multiplication.\n" +
						"\n" +
						"                  The register A receives the value in register B times\n" +
						"                  the value in register C, modulo 2^32.\n" +
						"\n" +
						"           #5. Division.\n" +
						"\n" +
						"                  The register A receives the value in register B\n" +
						"                  divided by the value in register C, if any, where\n" +
						"                  each quantity is treated treated as an unsigned 32\n" +
						"                  bit number.\n" +
						"\n" +
						"           #6. Not-And.\n" +
						"\n" +
						"                  Each bit in the register A receives the 1 bit if\n" +
						"                  either register B or register C has a 0 bit in that\n" +
						"                  position.  Otherwise the bit in register A receives\n" +
						"                  the 0 bit.\n" +
						"\n" +
						"  Other Operators.\n" +
						"  ----------------\n" +
						"\n" +
						"  The following instructions ignore some or all of the A, B and C\n" +
						"  registers.\n" +
						"\n" +
						"           #7. Halt.\n" +
						"\n" +
						"                  The universal machine stops computation.\n" +
						"\n" +
						"           #8. Allocation.\n" +
						"\n" +
						"                  A new array is created with a capacity of platters\n" +
						"                  commensurate to the value in the register C. This\n" +
						"                  new array is initialized entirely with platters\n" +
						"                  holding the value 0. A bit pattern not consisting of\n" +
						"                  exclusively the 0 bit, and that identifies no other\n" +
						"                  active allocated array, is placed in the B register.\n" +
						"\n" +
						"           #9. Abandonment.\n" +
						"\n" +
						"                  The array identified by the register C is abandoned.\n" +
						"                  Future allocations may then reuse that identifier.\n" +
						"\n" +
						"          #10. Output.\n" +
						"\n" +
						"                  The value in the register C is displayed on the console\n" +
						"                  immediately. Only values between and including 0 and 255\n" +
						"                  are allowed.\n" +
						"\n" +
						"          #11. Input.\n" +
						"\n" +
						"                  The universal machine waits for input on the console.\n" +
						"                  When input arrives, the register C is loaded with the\n" +
						"                  input, which must be between and including 0 and 255.\n" +
						"                  If the end of input has been signaled, then the\n" +
						"                  register C is endowed with a uniform value pattern\n" +
						"                  where every place is pregnant with the 1 bit.\n" +
						"\n" +
						"          #12. Load Program.\n" +
						"\n" +
						"                  The array identified by the B register is duplicated\n" +
						"                  and the duplicate shall replace the '0' array,\n" +
						"                  regardless of size. The execution finger is placed\n" +
						"                  to indicate the platter of this array that is\n" +
						"                  described by the offset given in C, where the value\n" +
						"                  0 denotes the first platter, 1 the second, et\n" +
						"                  cetera.\n" +
						"\n" +
						"                  The '0' array shall be the most sublime choice for\n" +
						"                  loading, and shall be handled with the utmost\n" +
						"                  velocity.\n" +
						"\n" +
						"  Special Operators.\n" +
						"  ------------------\n" +
						"\n" +
						"  One special operator does not describe registers in the same way.\n" +
						"  Instead the three bits immediately less significant than the four\n" +
						"  instruction indicator bits describe a single register A. The\n" +
						"  remainder twenty five bits indicate a value, which is loaded\n" +
						"  forthwith into the register A.\n" +
						"\n" +
						"                   A\n" +
						"                   |\n" +
						"                   vvv\n" +
						"              .--------------------------------.\n" +
						"              |VUTSRQPONMLKJIHGFEDCBA9876543210|\n" +
						"              `--------------------------------'\n" +
						"               ^^^^   ^^^^^^^^^^^^^^^^^^^^^^^^^\n" +
						"               |      |\n" +
						"               |      value\n" +
						"               |\n" +
						"               operator number\n" +
						"\n" +
						"               Figure 3. Special Operators\n" +
						"\n" +
						"          #13. Orthography.\n" +
						"\n" +
						"                  The value indicated is loaded into the register A\n" +
						"                  forthwith.\n" +
						"\n" +
						"  Cost-Cutting Measures.\n" +
						"  ----------------------\n" +
						"\n" +
						"  As per our meeting on 13 Febtober 19106, certain \"impossible\n" +
						"  behaviors\" may be unimplemented in the furnished device. An\n" +
						"  exhaustive list of these Exceptions is given below. Our contractual\n" +
						"  agreement dictates that the machine may Fail under no other\n" +
						"  circumstances.\n" +
						"\n" +
						"\n" +
						"  If at the beginning of a cycle, the execution finger does not indicate\n" +
						"  a platter that describes a valid instruction, then the machine may Fail.\n" +
						"\n" +
						"  If the program decides to index or amend an array that is not\n" +
						"  active, because it has not been allocated or it has been abandoned,\n" +
						"  or if the offset supplied for the access lies outside the array's\n" +
						"  capacity, then the machine may Fail.\n" +
						"\n" +
						"  If the program decides to abandon the '0' array, or to abandon an array\n" +
						"  that is not active, then the machine may Fail.\n" +
						"\n" +
						"  If the program sets out to divide by a value of 0, then the machine\n" +
						"  may Fail.\n" +
						"\n" +
						"  If the program decides to load a program from an array that is not\n" +
						"  active, then the machine may Fail.\n" +
						"\n" +
						"  If the program decides to Output a value that is larger than 255, the\n" +
						"  machine may Fail.\n" +
						"\n" +
						"  If at the beginning of a machine cycle the execution finger aims\n" +
						"  outside the capacity of the 0 array, the machine may Fail.\n" +
						"");
				sc_le_classique.nextLine();
				sc_le_classique.nextLine();
			}
		}while(run);

		sc_le_classique.close();





	}
}
