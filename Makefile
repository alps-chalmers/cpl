all:
	bnfc CPL.cf
	happy -gca ParCpl.y
	alex -g LexCpl.x
	ghc --make TestCpl.hs -o TestCpl

test:
	cd test && ghc -o Test -main-is Test.main Test.hs && \
		./Test "../TestCpl" "samples"

btest: all test

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi *.bak *.x *.y

distclean: clean
	-rm -f DocCpl.* LexCpl.* ParCpl.* LayoutCpl.* SkelCpl.* PrintCpl.* TestCpl.* AbsCpl.* TestCpl ErrM.* SharedString.* ComposOp.* cpl.dtd XMLCpl.* Makefile*
	
.PHONY: all test clean
