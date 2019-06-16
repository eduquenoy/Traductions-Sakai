/*
Ouverture liste des fichiers
Ouverture fichier source
Ouverture fichier cible
Scrutation fichier source et récupération sous forme d'objet
Scrutation fichier cible et recherche du mot clef d'identification de la chaine à traduire
*/
Dico dico; //Dictionnaire de traduction
void setup() {
  dico = new Dico("v11.xliff");
//  println(dico);
  println(dico.get("The alias id ''{0}'' is invalid."));

//Chargement du fichier à compléter
String[] translations = loadStrings("alias_fr_FR.po");
//String msgid;
int position,begin,end;
String sourceString, targetString;
for (int i = 0 ; i < translations.length; i++) {
//  msgid = translations[i].substring(0,5);
  position = translations[i].indexOf("msgid");
  if(position==0){
    //Il faut récupérer ce qui est entre guillemets
    //On calcule la position du début et de la fin
    begin = translations[i].indexOf('"');
    end = translations[i].indexOf('"',begin+1);
    sourceString = translations[i].substring(begin+1,end);

    if(sourceString.length() > 0) {
          println("SOURCE : " + sourceString);
          targetString = dico.get(sourceString);//Lecture de la chaîne traduite            
          if(targetString.length() > 0){
            println("TRADUC : "+targetString);
          //Insertion dans le fichier de sortie
           targetString= "msgstr \"" + targetString+"\""; 
           if(translations[i+1].indexOf("msgstr") == 0){
              translations[i+1] = targetString;
           }
          }
    }
    else{
      println("CHAINE VIDE");
    }
  }
//  println("Position : "+position);
}
saveStrings("alias_fr_FR_complete.po",translations);

}
