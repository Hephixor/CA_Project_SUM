#/bin/bash
cat ../data/multi_stmt.input > ../data/sum.sum
cd ../sum
make
./toUM
cd ../um
ant create_run_jar
java -jar um.jar -f ../data/outUM.um
diff -s ../data/out.txt ../data/multi_stmt.output
cd ../tests
