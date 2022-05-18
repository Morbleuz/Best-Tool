import 'couleur.dart';
import 'fonction.dart';
import 'ihmapache.dart';

class IHMSERVICE{
    static menu(){
    Couleur.effaceScreen();
    print(Couleur.green() + 
    "+--------------------------------------------------+\n"+
    "|                    Menu Service                  |\n"+
    "|                                                  |\n"+
    "| 1 - Apache                                       |\n"+
    "| 2 -                                              |\n"+
    "| 3 -                                              |\n"+
    "| 4 -                                              |\n"+
    "|                                                  |\n"+
    "| R - Retour                                       |\n"+
    "+--------------------------------------------------+\n"+
    Couleur.reset()  
    );
  }

  static Future<void> afficheMenu() async{
    bool valide = false;
    while(!valide){
    menu();
    String next = "";
    String choix = Fonction.saisirString();
    if(choix == "1"){
      await IHMAPACHE.menu();
    }else if(choix == "3"){

    }else if(choix == "4"){
      
    }else if(choix == "R"){
        valide = true;
        next = "fini";
    }else {
      print(Couleur.rouge()+"Saisir une valeur valide !" + Couleur.reset());
      choix = Fonction.saisirString();
    }
    if(next!="fini"){
      print("\nAppuyez sur une touche pour continuer..."+Couleur.reset());
      next = Fonction.saisirString();
    }

    }
  }
}