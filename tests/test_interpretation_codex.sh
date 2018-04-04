#/bin/bash


cd ../um
ant create_run_jar
java -jar um.jar -f ../data/codex.um
diff -s ../data/out.txt ../data/multi_stmt.output
cd../tests
