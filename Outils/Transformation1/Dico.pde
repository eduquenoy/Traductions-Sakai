class Dico extends StringDict {

  Dico(String translations){
      XML xml,target, source,body;
      String nameTarget;
      String nameSource;
      XML[] files, children;
      xml = loadXML(translations); //Chargement du fichier complet des traductions
      files = xml.getChildren("file"); //Descente dans l'arbre et recupération de toutes les branches "file"
      for(int j = 0; j < files.length; j++){
        body = files[j].getChild("body");//Exploration de la branche "body"
        children = body.getChildren("trans-unit"); //lecture des éléments d'une clef de traduction
        for (int i = 0; i < children.length; i++) {
          target = children[i].getChild("target"); //Cible de la clef
          source = children[i].getChild("source"); //Source de la clef
          nameTarget = target.getContent();
          nameSource = source.getContent();
        set(nameSource,nameTarget); //Ecriture dans le dictionnaire 
      //println("Nom " + nameTarget);
    }
  }

  }
}
