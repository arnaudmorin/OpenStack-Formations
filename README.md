Supports de formation OpenStack
===============================

Supports de formation (sous forme de slides) sur OpenStack écrits en Français et réalisés par Osones (https://osones.com/) et modifiés par Arnaud Morin.
Sont notamment abordés les sujets suivants : la virtualisation de serveur, le cloud, le projet OpenStack, l'utilisation d'OpenStack, le déploiement d'OpenStack, et les manières de tirer partie d'une infrastructure IaaS.

Auteurs :
* Adrien Cunin <adrien.cunin@osones.com>
* Pierre Freund <pierre.freund@osones.com>
* Arnaud Morin <arnaud.morin@gmail.com>

Installation de LaTeX (Ubuntu)
------------------------------

       sudo apt-get install texlive-lang-french texlive texlive-latex3

Générations des PDFs
--------------------

Tous :

       make

Un style (screen, handout ou print) :

       make style.pdf

Une partie (virtualisation, cloud) :

       make -f Makefile_virtualisation

Copyright et licence
--------------------
Tous les contenus originaux (Makefile, les fichiers dans latex/) sont :
* Copyright © 2014 Osones
* Distribués sous licence Creative Commons BY-SA 4.0.

![Creative Commons BY-SA](http://mirrors.creativecommons.org/presskit/buttons/88x31/png/by-sa.png)

https://creativecommons.org/licenses/by-sa/4.0/

Les autres fichiers du répertoire images/ sont soumis à leur copyright et licence respectifs.
