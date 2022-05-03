import 'couleur.dart';
import 'fonction.dart';
import 'ihmcommandelinux.dart';

class IHM {
  static void afficheTitre() async {
    Couleur.effaceScreen();
    print(Couleur.green() +
        " ____            _     _____           _\n" +
        "| ___ \\         | |   |_   _|         | |\n" +
        "| |_/ / ___  ___| |_    | | ___   ___ | |\n" +
        "| ___ \\/ _ \\/ __| __|   | |/ _ \\ / _ \\| |\n" +
        "| |_/ /  __/\\__ \\ |_    | | (_) | (_) | |\n" +
        "\\____/ \\___||___/\\__|   \\_/\\___/ \\___/|_|" +
        Couleur.reset());
  }
  static void afficheMenu() async {
    Couleur.effaceScreen();
    print(Couleur.green() + 
    "+------------------------------------+\n"+
    "| 1 - Commandes Linux                |\n"+
    "| 2 - Installer un service           |\n"+
    "| 3 - Sécuriser son serveur          |\n"+
    "| 4 - Installation de CMS            |\n"+
    "+------------------------------------+\n"+
    Couleur.reset()  
    );
    int choix = Fonction.saisirInt();
    while(choix!=1 && choix!=2 && choix!=3 && choix!=4 ){
      print(Couleur.rouge() + "Saisir une valeur valide !"+Couleur.reset());
      choix = Fonction.saisirInt();
    }
    if(choix == 1){
      IHMCMDLINUX.afficheMenu();
    }
  }

  
}
