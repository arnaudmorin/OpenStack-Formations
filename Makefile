SHELL=/bin/bash

# Les morceaux que l'on veut inclure
PARTS = introduction virtualisation cloud openstack

# Par défaut on génère tous les styles : screen, handout et print
all: full.pdf clean

# Nécessaire pour la suite
pwd:=$(shell pwd)
result:=$(pwd)/result

# Construction du style demandé, avec les morceaux choisis
%.pdf: latex/styles/%.tex latex/*.tex
	# Creation d'un temp dir
	$(eval tmp:=$(shell mktemp -d $(pwd)/tmp.XXX))
	# Copie du fichier correspondant au style (qui contient le documentclass)
	# et création du fichier .tex final qui porte le nom du style
	cp $< $(tmp)/$*.tex
	# Copie du fichier common.tex dans le .tex
	cat latex/common.tex >> $(tmp)/$*.tex
	# Copie de tous les autres fichiers tex dans l'ordre défini dans PARTS
	$(foreach part,$(PARTS),cat latex/$(part).tex >> $(tmp)/$*.tex;)
	# Marquage fin du fichier
	echo '\end{document}' >> $(tmp)/$*.tex
	# Création PDF
	mkdir -p ${result}
	pdflatex -output-directory $(result) $(tmp)/$*.tex
	# Seconde compilation pour TOC
	pdflatex -output-directory $(result) $(tmp)/$*.tex
	rm -rf $(tmp)
	# Liens symboliques
	#ln -sf result/$*.pdf $*.pdf

# On ne garde que les PDFs résultants
clean:
	rm -f $(result)/*.{aux,log,nav,out,snm,toc}

# On nettoie tout
mrproper: clean
	rm -rf $(result)/
	rm *.pdf
