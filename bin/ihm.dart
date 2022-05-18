import 'couleur.dart';
import 'fonction.dart';
import 'ihmcms.dart';
import 'ihmcommandelinux.dart';
import 'ihmservice.dart';

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

  static void menu(){
    print(Couleur.green() + 
        "+------------------------------------+\n"+
        "|             BEST TOOL              |\n"+
        "|                                    |\n"+
        "| 1 - Commandes Linux                |\n"+
        "| 2 - Installer un service           |\n"+
        "| 3 - Sécuriser son serveur          |\n"+
        "| 4 - Installation de CMS            |\n"+
        "| Q - Quitter le programme           |\n"+
        "|                                    |\n"+
        "|                        Version 1.0 |\n"+
        "+------------------------------------+\n"+
        Couleur.reset()  
        );
  }

  static Future<void> afficheMenu() async {
    bool valide = false;
    while(!valide){
    Couleur.effaceScreen();
    menu();
    String choix = Fonction.saisirString();
    if(choix == "1"){
      await IHMCMDLINUX.afficheMenu();
    }else if(choix == "2"){
      await IHMSERVICE.afficheMenu();
    }else if(choix == "3"){

    }else if(choix == "4"){
      await IHMCMS.afficheMenu();
    }else if(choix == "Q"){
      valide = true;
      afficheFin();
    }else{
      print(Couleur.rouge()+"/!\\ Saisir une valeur valide /!\\"+Couleur.reset());
    }
    
    }
    

  }

  static void afficheFin(){
    print("Fin du programme");
  }
  
}
