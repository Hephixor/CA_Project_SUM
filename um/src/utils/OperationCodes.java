package utils;

public enum OperationCodes {
	CONDITIONAL_MOVE(0),
	ARRAY_INDEX(1),
	ARRAY_AMENDEMENT(2),
	ADD(3),
	MUL(4),
	DIV(5),
	NOT_AND(6),
	STOP(7),
	ALLOCATION(8),
	ABANDON(9),
	PRINT_OUT(10),
	TYPE_IN(11),
	LOAD_PROGRAM(12),
	SPELL(13);
	//	CONDITIONAL_MOVE(0,"CONDITIONAL_MOVE"),
	//	ARRAY_INDEX(1,"ARRAY_INDEX"),
	//	ARRAY_AMENDEMENT(2,"ARRAY_AMENDEMENT"),
	//	ADD(3,"ADD"),
	//	MUL(4,"MUL"),
	//	DIV(5,"DIV"),
	//	NOT_AND(6,"NOT_AND"),
	//	STOP(7,"STOP"),
	//	ALLOCATION(8,"ALLOCATION"),
	//	ABANDON(9,"ABANDON"),
	//	PRINT_OUT(10,"PRINT_OUT"),
	//	TYPE_IN(11,"TYPE_IN"),
	//	LOAD_PROGRAM(12,"LOAD_PROGRAM"),
	//	SPELL(13,"SPELL");

	private int code;
//	private String name;

	OperationCodes(int c) {
		this.code = c;
	}
	
//	OperationCodes(int c, String n) {
//		this.name = n;
//	}

	public int getOperationCode() {
		return code;
	}

//	public String getName() {
//		return this.name;
//	}

	public static OperationCodes getOperationFromCode(int code) {
		for (OperationCodes op : values()) {
			if (code == op.code) {
				return op;
			}
		}
		return null;
	}
}
