package src;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.concurrent.Callable;

import exceptions.WordException;
import javafx.beans.property.SimpleFloatProperty;

public class UMInitializerThread implements Callable<int[]>{

	private final String pathfile;
	volatile static int[] program = {1,2};
	static SimpleFloatProperty progress = new SimpleFloatProperty();

	public UMInitializerThread(String p) throws IOException, WordException {
		this.pathfile = p;
	}

	@Override
	public int[] call() {
		System.out.println("UMInitializer Thread started");
		InputStream in = null;
		try {
			in = new FileInputStream(pathfile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		ByteArrayOutputStream byteArray = new ByteArrayOutputStream();
		int readByte;
		try {
			while ((readByte = in.read()) != -1){
				byteArray.write(readByte);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		byte bytes[] = byteArray.toByteArray();
		if (bytes.length % 4 != 0) {
			try {
				throw new WordException("Exception while reading word");
			} catch (WordException e) {
				e.printStackTrace();
			}
		} 

		int chunks[] = new int[bytes.length / 4];
		int firstFileSize = bytes.length/4;
		float dl = 0;
		for (int i = 0; i < chunks.length; i++) {
			int currentByte = i * 4;
			int chunkA = (bytes[currentByte] & 255) << 24;
			int chunkB = (bytes[currentByte + 1] & 255) << 16;
			int	chunkC = (bytes[currentByte + 2] & 255) << 8;
			int chunkD = (bytes[currentByte + 3] & 255);
			chunks[i] = chunkA | chunkB | chunkC | chunkD ;
			
			dl=((float)(i+1))/firstFileSize;
			if(dl%0.1==0)
			progress.set(dl);
		}
		System.out.println("Program loaded.");

		program = Arrays.copyOf(chunks, chunks.length);
		progress.set(dl);
		System.out.println("Program length: " + program.length);
		try {
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return program;
	}




	
}
