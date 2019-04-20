const String markdown = '''
# project_pitcho

Une application qui permet a son utilisateur de choisir un eleve au hasard dans un fichier

### Comment editer la liste d'eleves

#### Sur Android:
- Depuis votre ordinateur, ou un editeur de texte sur votre telephone: Ecrire un nom d'eleve par ligne dans un fichier avec ou sans extension sans laisser de ligne vide a la fin. Vous pouvez tres bien creer plusieurs fichier de classe et vous pouvez, par exemple creer un dossier "classes" dans lequel se trouveront "2nde5", "1reS2", "TS5". Ce dossier doit se trouver quelque part qui ne requiert pas l'acces root (vous pouvez donc le mettre dans "Internal Storage")
Un fichier de classe se presente donc comme ceci:
```
Prenom NOM
Prenom2 NOM2
Prenom3 NOM3
...
```
- Dans l'application, appuyer sur le bouton '+' en haut a droite dans la barre, cela va ouvrir un explorateur de fichier.
- Naviguer jusque dans le directory ou se trouve le fichier precedemment ecrit, et selectionner le fichier de classe voulu.
- Le fichier est maintenant en RAM sous forme de List<String>, vous pouvez a present appuyer sur le bouton "Choose random student", cela choisira un eleve au hasard dans la liste.
''';