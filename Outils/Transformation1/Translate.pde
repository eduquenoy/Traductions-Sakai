class Translate{
Translate (String file){
  String[] translations = loadStrings(file);
  int position,begin,end;
  String sourceString, targetString;
  for (int i = 0 ; i < translations.length; i++) {
  position = translations[i].indexOf("msgid");
  if(position==0){
    //Il faut récupérer ce qui est entre guillemets
    //On calcule la position du début et de la fin
    begin = translations[i].indexOf('"');
    end = translations[i].indexOf('"',begin+1);
    sourceString = translations[i].substring(begin+1,end);

    if(sourceString.length() > 0) {
    //      println("SOURCE : " + sourceString);
          if(dico.hasKey(sourceString)){
            targetString = dico.get(sourceString);//Lecture de la chaîne traduite            
          
            if(targetString.length() > 0){
            
  //          println("TRADUC : "+targetString);
          //Insertion dans le fichier de sortie
             targetString= "msgstr \"" + targetString+"\""; 
             if(translations[i+1].indexOf("msgstr") == 0){
                translations[i+1] = targetString;
           }
          }
          }
    }
    else{
//      println("CHAINE VIDE");
    }
  }
//  println("Position : "+position);
}
saveStrings("complete_"+file,translations);

}
}
