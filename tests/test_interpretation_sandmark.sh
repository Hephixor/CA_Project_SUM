#/bin/bash

cd ../um
ant create_run_jar
java -jar um.jar -f ../data/sandmark.umz.um
diff -s ../data/out.txt ../data/multi_stmt.output
cd ../tests
