all:	run
build:	./bin/libnative.so ./bin/hello.o

br_com_camilotk_hellojni_HelloWorldJNI.h:	./src/main/java/br/com/camilotk/hellojni/HelloWorldJNI.java
	javac -h . ./src/main/java/br/com/camilotk/hellojni/HelloWorldJNI.java

./bin/libnative.so: ./bin/br_com_camilotk_hellojni_HelloWorldJN.o
	g++ -shared -fPIC -o ./bin/libnative.so ./bin/br_com_camilotk_hellojni_HelloWorldJN.o -lc

./bin/br_com_camilotk_hellojni_HelloWorldJN.o:	./src/main/java/br/com/camilotk/hellojni/br_com_camilotk_hellojni_HelloWorldJNI.cpp
	mkdir bin
	g++ -c -fPIC -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux ./src/main/java/br/com/camilotk/hellojni/br_com_camilotk_hellojni_HelloWorldJNI.cpp -o ./bin/br_com_camilotk_hellojni_HelloWorldJN.o

./bin/hello.o: src/main/java/br/com/camilotk/hellojni/HelloOcaml.ml
	ocamlopt -o ./bin/hello -c src/main/java/br/com/camilotk/hellojni/HelloOcaml.ml

run:	build
	@java -Dfile.encoding=UTF-8 -Djava.library.path=./bin -cp ./target/classes br.com.camilotk.hellojni.HelloWorldJNI
