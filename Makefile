SHELL=bash
TARGET=main.pdf
LL=latexmk -pdf -pdflatex="pdflatex --shell-escape %O %S"
CLEAN=latexmk -C
export PATH := pygments:${PATH}


all: $(TARGET)

pdf: $(TARGET)

.PHONY : clean $(TARGET)

$(TARGET): $(TARGET:%.pdf=%.tex) $(SRC)
	$(LL) $<

clean:
	$(CLEAN)

mupdf:
	mupdf $(TARGET) &

zathura:
	zathura $(TARGET) &

evince:
	evince $(TARGET) &

compress: $(TARGET)
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dBATCH  -dQUIET -sOutputFile=compressed.pdf $(TARGET)


# vim: set tabstop=4 shiftwidth=4 noexpandtab:
