import 'couleur.dart';
import 'fonction.dart';
import 'service.dart';

class IHMAPACHE{
    static menu(){
    Couleur.effaceScreen();
    print(Couleur.green() + 
    "+--------------------------------------------------+\n"+
    "|                    Menu Aache                    |\n"+
    "|                                                  |\n"+
    "| 1 - Installation de Apache                       |\n"+
    "| 2 - Création d'un nouveau site (conf,dossier)    |\n"+
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
      String reponse = await Service.installApache();
      if(reponse == "0"){
        print(Couleur.green() + "Installation correctement effectué !" + Couleur.reset());

      }else{
        print(Couleur.rouge()+"Erreur lors de l'installation de apache, code d'erreur : " + reponse + Couleur.reset());
      };
    }else if(choix == "2"){
      print(Couleur.blue() + "Saisir le nom du site" + Couleur.reset());
      String nomSite = Fonction.saisirString();
      await Service.nouveauSite(nomSite);
      print(Couleur.green() + "La conf $nomSite à bien été créer dans le répertoire "+ Couleur.blue() + " /etc/apache2/site-available/$nomSite.conf" + Couleur.reset());
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