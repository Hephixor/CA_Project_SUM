package exceptions;

public class WordException extends Exception{

	private static final long serialVersionUID = 1L;
	
	public WordException(String err) {
		super(err);
	}
}
