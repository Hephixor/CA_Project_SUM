package utils;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import exceptions.InstructionException;

public class UMRunner {

	//Universal Machine structure
	private boolean isRunning = false;
	private int currentIndex;
	private int program[];
	private int registers[] = new int[8];
	private ArrayList<int[]> collections = new ArrayList<int[]>();
	private ArrayList<Integer> boards = new ArrayList<Integer>();
	private InputStream inputStream = System.in;

	private OutputStream outputStream = System.out;
	final Map<Integer, OperationCodes> operations = new HashMap<Integer, OperationCodes>();


	FileOutputStream fileOutputStream ;


	//Retrieve current board instruction
	private int code;
	private int regval;
	private int board;
	private byte regA;
	private byte regB;
	private byte regC;

	//Enum ?
//    final byte CONDITIONAL_MOVE = 0;
//    final byte ARRAY_INDEX = 1;
//    final byte ARRAY_MODIFICATION = 2;
//    final byte ADD = 3;
//    final byte MUL = 4;
//    final byte DIV = 5;
//    final byte NOT_AND = 6;
//    final byte STOP = 7;
//    final byte ALLOCATION = 8;
//    final byte ABANDON = 9;
//    final byte PRINT_OUT = 10;
//    final byte TYPE_IN = 11;
//    final byte LOAD_PROGRAM = 12;
//    final byte SPELL = 13;



	public UMRunner(int[] program) {
		this.isRunning=false;
		this.program = new int[program.length];
		//Initial array reservation
		this.collections.add(null);
		//We intend to make a clone of the array, not an instance pointing on the first one's value
		this.program = Arrays.copyOf(program, program.length);
		//Mapping operators to operation code
		for (OperationCodes op : OperationCodes.values()) {
            operations.put(op.getOperationCode(),op);
        }

		try {
			//fileOutputStream = new FileOutputStream("/users/Etu9/3200849/workspace/MSTL/CA/Universal_Machine/test.umz");
			fileOutputStream = new FileOutputStream("/users/Etu9/3200849/workspace/MSTL/CA/Universal_Machine/out.txt");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	//Retrieve machine running/stopped
	public boolean isRunning() {
		return isRunning;
	}

	//Turn on/off machine
	public void toggleRunning() {
		if(isRunning == true) isRunning = false;
		else isRunning = true;
	}

	//Match operator code with operator type and capture registers A,B,C from current board
	public void getNextInstruction() {
		//System.out.println("currentIndex "+currentIndex);
		//Go to next board
		board = program[currentIndex++];
		//Switch to operator section
		code = board>>>28;

		//Standard operator
		if (code < 13) {
			regA = (byte) ((board & 448) >>> 6);// Mask 0000000000000000000111000000
			regB = (byte) ((board & 56) >>> 3); // Mask 0000000000000000000000111000
			regC = (byte) (board & 7); 			// Mask 0000000000000000000000000111
			regval = 0;
		}

		//Special operator
		else {
			regA = (byte) ((board & 234881024) >>> 25); // Mask 1110000000000000000000000000
			regB = 0;
			regC = 0;
			regval = board & 33554431; 					  // Mask 0001111111111111111111111111
		}
	}

	public void executeInstruction() throws InstructionException {
		//Retrieving next instruction code
		getNextInstruction();
		int array[];

		//Map code to instruction
		OperationCodes operation = OperationCodes.getOperationFromCode(code);
		if(operation == null) System.out.println("operation = null" + code);
		else{
		switch (operation) {
/* BASIC OPERATORS */
//			#0. Conditional Move.
//
//    	      The register A receives the value in register B,
//   	      unless the register C contains 0.
		case CONDITIONAL_MOVE:
			if (registers[regC] != 0) {
				registers[regA] = registers[regB];
			}
			break;
// ---------------------------------------------------------------------
//			#1. Array Index.
//
//            The register A receives the value stored at offset
//            in register C in the array identified by B.
		case ARRAY_INDEX:
			if (registers[regB] == 0) {
				array = program;
			} else {
				array = (int[]) collections.get(registers[regB]);
			}
			registers[regA] = array[registers[regC]];
			break;
// ---------------------------------------------------------------------
//			#2. Array Amendment.
//
//            The array identified by A is amended at the offset
//            in register B to store the value in register C.
		case ARRAY_AMENDEMENT:
			if (registers[regA] == 0) {
				array = program;
			} else {
				array = (int[]) collections.get(registers[regA]);
			}
			array[registers[regB]] = registers[regC];
			break;
// ---------------------------------------------------------------------
//			#3. Addition.
//
//            The register A receives the value in register B plus
//            the value in register C, modulo 2^32.
		case ADD:
			registers[regA] = registers[regB] + registers[regC];
			break;
// ---------------------------------------------------------------------
//			 #4. Multiplication.
//
//             The register A receives the value in register B times
//             the value in register C, modulo 2^32.
		case MUL:
			registers[regA] = registers[regB] * registers[regC];
			break;
// ---------------------------------------------------------------------
//	         #5. Division.
//
//	           The register A receives the value in register B
//	           divided by the value in register C, if any, where
//	           each quantity is treated treated as an unsigned 32
//	           bit number.
		case DIV:
			registers[regA] = (int) ((registers[regB] & 0xFFFFFFFFL) / (registers[regC] & 0xFFFFFFFFL)); //Mask 11111111111111111111111111111111 unsigned
			break;
// ---------------------------------------------------------------------
//			#6. Not-And.
//
//            Each bit in the register A receives the 1 bit if
//            either register B or register C has a 0 bit in that
//            position.  Otherwise the bit in register A receives
//            the 0 bit.
		case NOT_AND:
			registers[regA] = ~(registers[regB] & registers[regC]); // Flipping bits
			break;
// ---------------------------------------------------------------------
/* OTHER OPERATORS */
//			 #7. Halt.
//
//             The universal machine stops computation.
		case STOP:
			isRunning = false;
			break;
// ---------------------------------------------------------------------
//			#8. Allocation.
//
//            A new array is created with a capacity of platters
//            commensurate to the value in the register C. This
//            new array is initialized entirely with platters
//            holding the value 0. A bit pattern not consisting of
//            exclusively the 0 bit, and that identifies no other
//            active allocated array, is placed in the B register.
		case ALLOCATION:
			if (boards.isEmpty()) {
				int[] newCollection = new int[registers[regC]];
				collections.add(newCollection);
				registers[regB] = collections.size() - 1;
			} else {
				int lo = boards.size() - 1;
				int i = ((Integer) boards.get(lo)).intValue();
				int[] newCollection = new int[registers[regC]];
				collections.set(i,newCollection);// setElementAt(new int[registers[regC]], i);
				boards.remove(lo);
				registers[regB] = i;
			}
			break;
// ---------------------------------------------------------------------
//			#9. Abandonment.
//
//            The array identified by the register C is abandoned.
//            Future allocations may then reuse that identifier.
		case ABANDON:
			if (registers[regC] == 0) {
				throw new InstructionException("RegC = 0 , ABANDON of array 0 forbidden");
			}
			collections.set(registers[regC], null);
			int newBoard = new Integer(registers[regC]);
			boards.add(newBoard);
			break;
// ---------------------------------------------------------------------
//			#10. Output.
//
//            The value in the register C is displayed on the console
//            immediately. Only values between and including 0 and 255
//            are allowed.
		case PRINT_OUT:
			if (registers[regC] > 255) {
				throw new InstructionException("Value must be between 0 - 255" );
			}
			try {
				byte[] strToBytes = BigInteger.valueOf(registers[regC]).toByteArray();
			   // fileOutputStream.write(strToBytes);
				outputStream.write((char) registers[regC]);
				outputStream.flush();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			break;
// ---------------------------------------------------------------------
//			  #11. Input.
//
//              The universal machine waits for input on the console.
//              When input arrives, the register C is loaded with the
//              input, which must be between and including 0 and 255.
//              If the end of input has been signaled, then the
//              register C is endowed with a uniform value pattern
//              where every place is pregnant with the 1 bit.
		case TYPE_IN:
			try {
				registers[regC] = inputStream.read();
			} catch (IOException e) {
				e.printStackTrace();
				return;
			}
			break;
// ---------------------------------------------------------------------
//			  #12. Load Program.
//
//              The array identified by the B register is duplicated
//              and the duplicate shall replace the '0' array,
//              regardless of size. The execution finger is placed
//              to indicate the platter of this array that is
//              described by the offset given in C, where the value
//              0 denotes the first platter, 1 the second, et
//              cetera.
//
//              The '0' array shall be the most sublime choice for
//              loading, and shall be handled with the utmost
//              velocity.
		case LOAD_PROGRAM:
			if (registers[regB] != 0) {
				int prog[] = (int[]) collections.get(registers[regB]);
				//program = new int[prog.length];
				program = Arrays.copyOf(prog, prog.length);
			}
			currentIndex = registers[regC];
			break;
// ---------------------------------------------------------------------
/* SPECIAL OPERATORS */
//			#13. Orthography.
//
//            The value indicated is loaded into the register A
//            forthwith.
		case SPELL:
			registers[regA] = regval;
			break;

		default:
			throw new InstructionException("Invalid instruction");
		}
		}
	}
// ---------------------------------------------------------------------
}
