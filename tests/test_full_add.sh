#/bin/bash
cat ../data/add.input > ../data/sum.sum
cd ../sum
make
./toUM
cd ../um
ant create_run_jar
java -jar um.jar -f ../data/outUM.um
diff -s ../data/out.txt ../data/add.output
cd ../tests
