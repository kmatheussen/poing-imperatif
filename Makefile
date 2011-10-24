
PREFIX = /usr/local/

QIDIR = ../QiII1.07
FAUSTDIR = ../faudiostream

VERSION=0.0.8

CLISP = clisp
SBCL = sbcl
LEX = lex

CPP = g++
OPT = -O3 -march=native

BENCHOPT = -O3 -march=native -fno-ipa-cp-clone

BINS = poing-imperatif faust-imp poing-imperatif-compiler

all: poing-imperatif $(BINS)



# Change here if you want to use sbcl instead of clisp
# SBCL is a tiny bit faster (8 vs 5 seconds for freeverb on my machine), while CLISP gives less trouble.
#
# However, since Faust uses much more time than poing-imperatif, causing the difference in combined compilation time
# to be very small, CLISP is probably the best choice.
poing-imperatif-compiler: poing-imperatif-compiler_clisp
#poing-imperatif-compiler: poing-imperatif-compiler_sbcl


clean:
	rm -fr *~ */*~ *.o testing/*_generated.dsp $(BINS) temp.cpp a.out freeverb-svg *.tar.gz lex.yy.c QiLisp/*

predist: clean
	mkdir -p dist
	rm -fr dist/*
	cp -a poing-imperatif.c poing-imperatif-compiler.qi Makefile QiLisp make_compiler.lsp freeverb_imp.dsp freeverb.dsp README tostring.qi dist/

dist: clean
	rm -fr /tmp/poing-imperatif-$(VERSION)
	rm -fr poing-imperatif-$(VERSION)
	mkdir /tmp/poing-imperatif-$(VERSION)
	cp -a * /tmp/poing-imperatif-$(VERSION)/
	rm -f /tmp/poing-imperatif-$(VERSION)/*.wav
	mv /tmp/poing-imperatif-$(VERSION) .
	tar cvf poing-imperatif-$(VERSION).tar poing-imperatif-$(VERSION)
	gzip poing-imperatif-$(VERSION).tar
	marcel_upload poing-imperatif-$(VERSION).tar.gz
	ls -la poing-imperatif-$(VERSION)
	rm -fr poing-imperatif-$(VERSION)

install: $(BINS)
	cp -f $(BINS) $(PREFIX)/bin/

uninstall:
	rm -f $(PREFIX)/bin/poing-imperatif
	rm -f $(PREFIX)/bin/poing-imperatif-compiler


# Only do this if there was a bug in the compiler which had rendred incorrect results in the testing/correct directory,
# or a new test has been added.
gen-correct:
	cd testing && ./test.scm gen-correct

check:
	cd testing && ./test.scm check


poing-imperatif-compiler_clisp: QiLisp/Qi.mem make_compiler_clisp.lsp poing-imperatif-compiler.qi tostring.qi
	$(CLISP) -C -x '(PROGN (LOAD "make_compiler_clisp.lsp") (save-compiler "/tmp/poing-imperatif-compiler"))' -M QiLisp/Qi.mem
	mv /tmp/poing-imperatif-compiler poing-imperatif-compiler

poing-imperatif-compiler_sbcl: QiLisp/Qi.core make_compiler_sbcl.qi poing-imperatif-compiler.qi tostring.qi
	echo "(load \"`pwd`/make_compiler_sbcl.qi\")" | $(SBCL) --control-stack-size 128 --core QiLisp/Qi.core
	mv /tmp/poing-imperatif-compiler poing-imperatif-compiler

QiLisp/Qi.mem: QiLisp
	cp $(QIDIR)/Lisp/*.lsp QiLisp/
	cd QiLisp/ && $(CLISP) -C -i install.lsp

QiLisp/Qi.core: QiLisp
	cp $(QIDIR)/Lisp/*.lsp QiLisp/
	cd QiLisp/ && $(SBCL) --load install.lsp

QiLisp:
	mkdir -p QiLisp

faust-imp: poing-imperatif
	ln -s poing-imperatif faust-imp

poing-imperatif: lex.yy.c poing-imperatif.c
	$(CPP) poing-imperatif.c -o poing-imperatif -DVERSION=\"$(VERSION)\" -I$(FAUSTDIR)/compiler/tlib -I$(FAUSTDIR)/compiler/parser -I$(FAUSTDIR)/compiler/boxes/ -I$(FAUSTDIR)/compiler/signals 

#&& ./a.out test8.dsp >test8_lexed.lsp && more test8_lexed.lsp

bench:
	make
	./poing-imperatif -a bench.cpp --keep testing/freeverb2.dsp >temp.cpp
#	$(CPP) temp.cpp $(OPT) -lpthread
	icc -fast temp.cpp -lpthread
	./a.out 

gtk-jack:
	make poing-imperatif
	./poing-imperatif -i freeverb_imp.dsp -o freeverb.dsp 
	faust -a jack-gtk.cpp freeverb.dsp >temp.cpp 
	$(CPP) temp.cpp `pkg-config --libs --cflags gtk+-2.0` $(OPT) -ljack
	./a.out

gtk-pitchshifter:
	make poing-imperatif
	./poing-imperatif -a alsa-gtk.cpp testing/am_pitchshift.dsp >temp.cpp
	$(CPP) temp.cpp `pkg-config --libs --cflags gtk+-2.0` $(OPT) -lasound
	./a.out

#FAUSTEXE = faust
FAUSTEXE = faust1
#FAUSTEXE = /usr/bin/faust

gtk-jack-pitchshifter:
	make poing-imperatif
	./poing-imperatif --faustexe $(FAUSTEXE) -a jack-gtk.cpp testing/am_pitchshift.dsp >temp.cpp
	$(CPP) temp.cpp `pkg-config --libs --cflags gtk+-2.0` $(OPT) -ljack
	./a.out

gtk-jack-pitchshifter-icc:
	make poing-imperatif
	./poing-imperatif -omp --faustexe $(FAUSTEXE) -a jack-gtk.cpp testing/am_pitchshift.dsp >temp.cpp
	icc `pkg-config --libs --cflags gtk+-2.0` -xHOST -O3 -ipo -no-prec-div  -ljack temp.cpp
#	icc `pkg-config --libs --cflags gtk+-2.0` -ljack temp.cpp
	./a.out

pitchshifter-bench:
	./poing-imperatif -vec --faustexe $(FAUSTEXE) -a bench.cpp testing/am_pitchshift.dsp >temp.cpp
#	g++ $(BENCHOPT) temp.cpp -lpthread
	icc -fast temp.cpp -lpthread
	./a.out
# 
freeverb-org-bench:
#	g++ $(BENCHOPT) testing/bench_freeverb_org.cpp testing/freeverb/Components/*.cpp -lpthread
	icc -fast testing/bench_freeverb_org.cpp testing/freeverb/Components/*.cpp -lpthread
	./a.out

lex.yy.c: 
	$(LEX) -I $(FAUSTDIR)/compiler/parser/faustlexer.l

