#/bin/bash
cat ../data/print.input > ../data/sum.sum
cd ../sum
make
./toUM
cd ../um
ant create_run_jar
java -jar um.jar -f ../data/outUM.um
diff -s ../data/out.txt ../data/print.output
cd ../tests
