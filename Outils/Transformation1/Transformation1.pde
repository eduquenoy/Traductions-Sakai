/*
Ouverture liste des fichiers
Ouverture fichier source
Ouverture fichier cible
Scrutation fichier source et récupération sous forme d'objet
Scrutation fichier cible et recherche du mot clef d'identification de la chaine à traduire
*/
Dico dico; //Dictionnaire de traduction
Translate translate;
void setup() {
  dico = new Dico("v11.xliff");
  //Chargement de la liste des fichiers à traduire
  String[] listFile=loadStrings("list.txt");
  for (int i = 0 ; i < listFile.length; i++) {
    println(listFile[i]);
    //Chargement du fichier à compléter
    translate = new Translate(listFile[i]);
  }
  
}
