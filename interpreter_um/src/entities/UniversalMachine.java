package entities;

import java.io.IOException;
import exceptions.InstructionException;
import exceptions.WordException;
import utils.UMInitializer;
import utils.UMRunner;

public class UniversalMachine {
	UMInitializer umi = null;
	UMRunner umr = null;

	public UniversalMachine(String path){
		try {
			umi = new UMInitializer(path);
			umr = new UMRunner(umi.getProgram());
		} catch (IOException | WordException e) {
			e.printStackTrace();
		}
	}

	public void run() {
		try {
			umr.toggleRunning();
			do {

				umr.executeInstruction();

			}while(umr.isRunning());

		} catch (InstructionException e) {
			e.printStackTrace();
		}
	}
}
