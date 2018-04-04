package src;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import utils.UMInitializer;
import utils.UMRunner;
import exceptions.InstructionException;
import exceptions.WordException;
import javafx.application.Application;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Accordion;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.ProgressIndicator;
import javafx.scene.control.RadioButton;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.control.TitledPane;
import javafx.scene.control.ToggleGroup;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.stage.DirectoryChooser;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

public class Main extends Application {
	UMInitializerThread sp = null;
	Runnable mf = null;
	int[] program = null;

	/**
	 *  Lance la methode start
	 * @param args
	 * init
	 */
	public static void main(String[] args) {
				
		switch(args.length){
		case 0:
			System.out.println("Usage : -x to use display mode");
			System.out.println("-f <path/to/file> to use command line mode");
			break;

		case 1:
			if(args[0].equalsIgnoreCase("-x")){
				launch(args);
			}
			else{
				System.out.println("Usage : -x to use display mode");
				System.out.println("-f <path/to/file> to use command line mode");
			}
			break;

		case 2:
			if(args[0].equalsIgnoreCase("-f") && args[1].length()!=0){
				try {
					UMInitializer umi = new UMInitializer(args[1]);
					UMRunner umr = new UMRunner(umi.getProgram());
					umr.toggleRunning();
					do{
						umr.executeInstruction();
					}while(umr.isRunning());
					
				} catch (IOException e) {
					e.printStackTrace();
				} catch (WordException e) {
					e.printStackTrace();
				} catch (InstructionException e) {
					e.printStackTrace();
				}
			}

			else{
				System.out.println("Usage : -x to use display mode");
				System.out.println("-f <path/to/file> to use command line mode");
			}
			break;

		default:
			System.out.println("Usage : -x to use display mode");
			System.out.println("-f <path/to/file> to use command line mode");
			break;
		}
		System.exit(0);
	}

	/**
	 * Creer la fenetre, les champs de texte, les boutons et les dispose dedans.
	 * @param primaryStage
	 * Fenetre utilisee pour creer l'application
	 */
	public void start(Stage primaryStage) {


		primaryStage.setTitle("Universal Machine");

		//Construction VerticalBox 1

		HBox h1 = new HBox();
		h1.setAlignment(Pos.TOP_CENTER);
		h1.setSpacing(10);

		HBox h2 = new HBox();
		h2.setAlignment(Pos.CENTER);
		h2.setSpacing(10);

		HBox h3 = new HBox();
		h3.setAlignment(Pos.CENTER);
		h3.setSpacing(10);

		HBox h3_5 = new HBox();
		h3_5.setAlignment(Pos.CENTER);
		h3_5.setSpacing(10);

		HBox h = new HBox();
		h.setAlignment(Pos.BOTTOM_CENTER);
		h.setSpacing(10);

		HBox h4 = new HBox();
		h4.setAlignment(Pos.BOTTOM_CENTER);
		h4.setSpacing(10);

		Label l1 = new Label("Renommer les parties: ");
		Label l1_2 = new Label(" .partX");
		Label l2 = new Label("Taille des parties (en Mégaoctets - minimum 1 Mo): ");
		TextField t = new TextField("/user/test/path");
		TextField tdest = new TextField("/chemin/de/destination");
		TextField t1 = new TextField("");
		TextField tt = new TextField("");

		Label deleteSrc = new Label("Supprimer le fichier source? ");
		RadioButton rb1Src = new RadioButton("Oui");
		RadioButton rb2Src = new RadioButton("Non");
		final ToggleGroup radioGroupSrc = new ToggleGroup(); 
		rb1Src.setToggleGroup(radioGroupSrc);
		rb2Src.setToggleGroup(radioGroupSrc);
		rb2Src.setSelected(true);



		VBox v = new VBox();
		v.setFillWidth(true);
		v.autosize();
		v.setAlignment(Pos.CENTER_LEFT);
		v.setSpacing(30);

		VBox v1 = new VBox();
		v1.setFillWidth(true);
		v1.autosize();
		v1.setAlignment(Pos.CENTER_RIGHT);
		v1.setSpacing(30);

		final Accordion accordion = new Accordion ();        
		ScrollPane scroll=new ScrollPane();
		scroll.setPrefHeight(accordion.getHeight());
		scroll.prefWidth(accordion.getWidth());
		TitledPane title=new TitledPane();
		title.setText("Codex rules");
		title.setContent(scroll);
		accordion.getPanes().add(title);
		Scene scene = new Scene(accordion, 700, 400, Color.LIGHTGREY);

		Button btnsrc = new Button();
		btnsrc.setLayoutX(scene.getWidth()/2);
		btnsrc.setLayoutY(20);
		btnsrc.setText("Choisir le fichier d'origine");
		btnsrc.setOnAction((event) -> {

			FileChooser fileChooser = new FileChooser();
			File selectedFile = fileChooser.showOpenDialog(null);

			if (selectedFile != null) {
				t.setText(selectedFile.getAbsolutePath());
			}

		});

		Button btndest = new Button();
		btndest.setLayoutX(scene.getWidth()/2);
		btndest.setLayoutY(20);
		btndest.setText("Choisir le dossier de destination");
		btndest.setOnAction((event) -> {

			DirectoryChooser directoryChooser = new DirectoryChooser();
			File destinationDirectory = directoryChooser.showDialog(primaryStage);

			try {
				tdest.setText(destinationDirectory.getCanonicalPath());	
			}
			catch (IOException e) {
				tdest.setText(destinationDirectory.getAbsolutePath());
			}



		});

		Button btn1 = new Button();
		btn1.setLayoutX(scene.getWidth()/2);
		btn1.setLayoutY(20);
		btn1.setText("Charger le programme");
		btn1.setOnAction((event) -> {

			//			//boolean delete;
			//
			//			if(rb1Src.isSelected()){
			//				delete=true;
			//			}
			//			else{delete=false;}

			if(t.getText().equals("/user/test/path")){
				System.out.println("Veuillez choisir un fichier.umz");
			}
			else{

				if(t1.getText().equals("")){	
					if(tt.getText().equals("")){				
						sp = null;
						try {
							sp = new UMInitializerThread(t.getText());

						} catch (IOException e1) {
							e1.printStackTrace();
						} catch (WordException e1) {
							e1.printStackTrace();
						}
						ExecutorService pool = Executors.newFixedThreadPool(2);
						try {

							Future<int[]> future = (Future<int[]>) pool.submit(sp);
							pool.shutdown();
							program = future.get();
							pool.awaitTermination(5, TimeUnit.SECONDS);

						}
						catch (InterruptedException e) {
							System.err.println("tasks interrupted");
						} catch (ExecutionException e) {

							e.printStackTrace();
						}
					}

				}
			}
		});

		// Ajout des éléments


		h1.getChildren().add(l1);
		h1.getChildren().add(t1);
		h1.getChildren().add(l1_2);
		h.getChildren().add(t);
		h.getChildren().add(btnsrc);
		h3.getChildren().add(tdest);
		h3.getChildren().add(btndest);
		h3_5.getChildren().add(deleteSrc);
		h3_5.getChildren().add(rb1Src);
		h3_5.getChildren().add(rb2Src);
		h4.getChildren().add(l2);
		h4.getChildren().add(tt);
		h2.getChildren().add(btn1);

		v.getChildren().add(h);
		//		v.getChildren().add(h3);
		//		v.getChildren().add(h1);
		//		v.getChildren().add(h3_5);
		//		v.getChildren().add(h4);
		v.getChildren().add(h2);

		ProgressBar pb = new ProgressBar(0);
		ProgressIndicator pi = new ProgressIndicator(0);
		pb.setMinWidth(400);
		pb.progressProperty().bind(UMInitializerThread.progress);
		pi.progressProperty().bind(UMInitializerThread.progress);

		h2.getChildren().add(pb);
		h2.getChildren().add(pi);


		//Construction VerticalBox 2

		HBox h1_2 = new HBox();
		h1_2.setAlignment(Pos.TOP_CENTER);
		h1_2.setSpacing(10);

		HBox h1_3 = new HBox();
		h1_3.setAlignment(Pos.TOP_CENTER);
		h1_3.setSpacing(10);

		HBox h1_3_5 = new HBox();
		h1_3_5.setAlignment(Pos.CENTER);
		h1_3_5.setSpacing(10);

		HBox h1_4 = new HBox();
		h1_4.setAlignment(Pos.BOTTOM_CENTER);
		h1_4.setSpacing(10);

		Text codex = new Text("\n" + 
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

	
		codex.wrappingWidthProperty().bind(scene.widthProperty());


		Button btnsrc2 = new Button();
		btnsrc2.setLayoutX(scene.getWidth()/2);
		btnsrc2.setLayoutY(20);
		btnsrc2.setText("Choisir le fichier");
		btnsrc2.setOnAction((event) -> {

		});

		Button btn2_2 = new Button();
		btn2_2.setLayoutX(scene.getWidth()/2);
		btn2_2.setLayoutY(20);
		btn2_2.setText("Lancer");
		btn2_2.setOnAction((event) -> {


			if(program!=null){

				UMRunner umr = new UMRunner(program);
				umr.toggleRunning();
				do {

					try {
						umr.executeInstruction();
					} catch (Exception e) {
						e.printStackTrace();
					}

				}while(umr.isRunning());
			}
			else{
				//Programme non chargé
				System.out.println("Impossible : No UM program loaded");
			}


		});


		h1_3.getChildren().add(btn2_2);
		v1.getChildren().add(h1_3);
		scroll.setContent(h1_2);

		//Disposition des elements dans la fenêtre
		TitledPane tp = new TitledPane();
		tp.setText("Load .umz file");
		tp.setContent(v);

		TitledPane tp2 = new TitledPane();
		tp2.setText("Run Universal Machine");
		tp2.setContent(v1);

		TitledPane[]tps = new TitledPane[2];
		tps[0]=tp;
		tps[1]=tp2;

		accordion.getPanes().addAll(tps);
		accordion.setExpandedPane(tps[0]);

		primaryStage.setScene(scene);
		primaryStage.show();
	}


}
