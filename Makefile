SFAQ="RasPi FAQ - Preguntas Frecuentas.pdf"
FFAQ="RasPi FAQ - Preguntas Frecuentas.md"
F1="Tema 1 - Qué es Raspberry.md"
S1="Tema 1 - Qué es Raspberry.docx"
F2="Tema 2 - Características de Raspberry.md"
S2="Tema 2 - Características de Raspberry.docx"
F3="Tema 3 - Instalación de Raspberry.md"
S3="Tema 3 - Instalación de Raspberry.docx"
F4="Tema 4 - Uso de Raspberry.md"
S4="Tema 4 - Uso de Raspberry.docx"
F5="Tema 5 - Programación con Raspberry.md"
S5="Tema 5 - Programación con Raspberry.docx"
F6="Tema 6 - Electrónica con Raspberry.md"
S6="Tema 6 - Electrónica con Raspberry.docx"

FMAT="Materiales.md"
SMAT="Materiales necesarios.pdf"

DIR_PUBLICACION="./publicacion"


all: 1 2 3 4 5 6 FAQ MAT

MAT:
	pandoc --latex-engine=xelatex   \
					-V papersize:a4paper    \
					--template=./LaTeX_ES.latex    \
					-o  $(SMAT)  \
					Cabecera.md        \
					$(FMAT)



FAQ:
	pandoc --latex-engine=xelatex   \
					-V papersize:a4paper    \
					--template=./LaTeX_ES.latex    \
					-o  $(SFAQ)  \
					Cabecera.md        \
					$(FFAQ)


5:
	pandoc  --latex-engine=xelatex   \
					-V papersize:a4paper    \
					--template=./LaTeX_ES.latex    \
					-o  $(S5)  \
					Cabecera.md        \
					$(F5)
6:
	pandoc --latex-engine=xelatex   \
					-V papersize:a4paper    \
					--template=./LaTeX_ES.latex    \
					-o $(S6)     \
					Cabecera.md        \
					$(F6)

1:
	pandoc --latex-engine=xelatex \
					--from=markdown \
					-V papersize:a4paper \
					--template=./LaTeX_ES.latex \
		      -o $(S1) \
		       Cabecera.md     \
		      $(F1)
2:
	pandoc --latex-engine=xelatex       \
					-V papersize:a4paper        \
					--template=./LaTeX_ES.latex \
					-o $(S2) \
					Cabecera.md           \
					$(F2)
3:
	pandoc --latex-engine=xelatex       \
					-V papersize:a4paper        \
					--template=./LaTeX_ES.latex \
					-o $(S3) \
					Cabecera.md           \
					$(F3)
4:
	pandoc --latex-engine=xelatex       \
					-V papersize:a4paper        \
					--template=./LaTeX_ES.latex \
					-o $(S4) \
					Cabecera.md           \
					$(F4)
clean:
	rm $(S5) $(S6) $(S1) $(S2) $(S3) $(S4) $(SFAQ)

publish:
	cp $(S5) $(S6) $(S1) $(S2) $(S3) $(S4) $(SFAQ) $(SMAT) $(DIR_PUBLICACION)
	cp *Objetivos*.pdf $(DIR_PUBLICACION)
	cp *Ejercicio*.pdf $(DIR_PUBLICACION)
	cp *Test*.pdf $(DIR_PUBLICACION)


push:
	git commit -m "update" $(S5);
	git commit -m "update" $(S6);
	git commit -m "update" $(S3);
	git commit -m "update" $(S4);
	git commit -m "update" $(S2);
	git commit -m "update" $(S1);
	git push;
