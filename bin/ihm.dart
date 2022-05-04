import 'couleur.dart';
import 'fonction.dart';
import 'ihmcommandelinux.dart';

class IHM {
  static Future<void> afficheTitre()  async{
    Couleur.effaceScreen();
    print(Couleur.green() +
        " ____            _     _____           _\n" +
        "| ___ \\         | |   |_   _|         | |\n" +
        "| |_/ / ___  ___| |_    | | ___   ___ | |\n" +
        "| ___ \\/ _ \\/ __| __|   | |/ _ \\ / _ \\| |\n" +
        "| |_/ /  __/\\__ \\ |_    | | (_) | (_) | |\n" +
        "\\____/ \\___||___/\\__|   \\_/\\___/ \\___/|_|" +
        Couleur.reset());
        await Future.delayed(const Duration(seconds: 1));
  }
  static Future<void> afficheMenu() async {
    bool valide = false;
    while(!valide){
      Couleur.effaceScreen();
    print(Couleur.green() + 
    "+------------------------------------+\n"+
    "| 1 - Commandes Linux                |\n"+
    "| 2 - Installer un service           |\n"+
    "| 3 - Sécuriser son serveur          |\n"+
    "| 4 - Installation de CMS            |\n"+
    "| Q - Quitter le programme           |\n"+
    "+------------------------------------+\n"+
    Couleur.reset()  
    );
    String choix = Fonction.saisirString();
    
    while(choix!="1" && choix!="2" && choix!="3" && choix!="4" && choix!="Q"){
      print(Couleur.rouge() + "Saisir une valeur valide !"+Couleur.reset());
      choix = Fonction.saisirString();
    }
    if(choix == "1"){
     await IHMCMDLINUX.afficheMenu();
    }else if(choix =="Q"){  
      valide = true;
    }
    }
    

  }

  static void afficheFin(){
    print("Fin du programme");
  }
  
}
