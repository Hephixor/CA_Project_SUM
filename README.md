# Universal Machine

![Hephixor on Travis CI][travis-image]

[travis-image]: http://www.boundvariable.org/spec.png

Universal Machine compiler and interpreter project


## Compiling sources

#### Compiler
In order to build the compiler, simply run `make` in the sum/ directory. The result is file *toUM* in the same directory
Please note that you need *Ocaml* dependancies installed on your machine.
```
cd sum
make
```

#### Interpreter
There is an *Ant Build* file in the um/ directory that you can run with command `ant createjar`, you need to have *Ant* installed on your machine.
```
cd um
ant create_run_jar
```


## Running
#### Compiler
To run the *S-UM compiler* and produce a UM file, go to sum/ directory and launch toUM.
```
cd sum
./toUM
```

#### Interpreter
Once you have produced the jar file from the interpreter sources, you can launch it two different modes from um/:
* Graphical
```
cd um
java -jar um.jar -x
```

* Command line
Or you can use it in command line mode giving the path to the file you want to interpret :
```
cd um
java -jar um.jar -f path/to/file
```

## Testing

Testing procedures have been defined so that you can test both S-UM compiler output and UM interpreter behavior.
There are several routines you can call with scripts placed in tests/ folder.

```
cd tests
./testscript_name.sh
```
