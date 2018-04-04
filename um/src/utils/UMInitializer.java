package utils;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

import exceptions.WordException;

public class UMInitializer {

	private final String pathfile;
	private int[] program = null;

	public UMInitializer(String p) throws IOException, WordException {
		this.pathfile = p;
		InputStream in = new FileInputStream(pathfile);
		ByteArrayOutputStream byteArray = new ByteArrayOutputStream();
		int readByte;
		while ((readByte = in.read()) != -1){
			byteArray.write(readByte);
		}
		in.close();
		byte bytes[] = byteArray.toByteArray();
		
		if (bytes.length % 4 != 0) {
			throw new WordException("Exception while reading word");
		} 

		int chunks[] = new int[bytes.length / 4];
		for (int i = 0; i < chunks.length; i++) {
			int currentByte = i * 4;
			int chunkA = (bytes[currentByte] & 255) << 24;
			int chunkB = (bytes[currentByte + 1] & 255) << 16;
			int	chunkC = (bytes[currentByte + 2] & 255) << 8;
			int chunkD = (bytes[currentByte + 3] & 255);
			chunks[i] = chunkA | chunkB | chunkC | chunkD ;
		}

		program = Arrays.copyOf(chunks, chunks.length);
	}
	
	public int[] getProgram() {
		return this.program;
	}


}