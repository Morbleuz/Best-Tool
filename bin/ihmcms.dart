import 'couleur.dart';
import 'fonction.dart';
import 'wordpress.dart';

class IHMCMS {
  static menu() {
    Couleur.effaceScreen();
    print(Couleur.green() +
        "+--------------------------------------------------+\n" +
        "|                    Menu CMS                      |\n" +
        "|                                                  |\n" +
        "| 1 - Installation de Wordpress                    |\n" +
        "| 2 -                                              |\n" +
        "| 3 -                                              |\n" +
        "| 4 -                                              |\n" +
        "|                                                  |\n" +
        "| R - Retour                                       |\n" +
        "+--------------------------------------------------+\n" +
        Couleur.reset());
  }

  static Future<void> afficheMenu() async {
    bool valide = false;
    while (!valide) {
      menu();
      String next = "";
      String choix = Fonction.saisirString();
      if (choix == "1") {
        print(Couleur.blue() +
            "Saisir le nom de la base de donnée (maBaseDeDonnée)" +
            Couleur.reset());
        String nomBDD = Fonction.saisirString();
        print(Couleur.blue() +
            "Saisir le nom du compte (admin)" +
            Couleur.reset());
        String compte = Fonction.saisirString();
        print(Couleur.blue() +
            "Saisir le môt de passe du compte ()" +
            Couleur.reset());
        String mdp = Fonction.saisirMdp();
        await Wordpress.install(nomBDD, compte, mdp);
      } else if (choix == "2") {
      } else if (choix == "3") {
      } else if (choix == "R") {
        valide = true;
        next = "fini";
      } else {
        print(Couleur.rouge() + "Saisir une valeur valide !" + Couleur.reset());
        choix = Fonction.saisirString();
      }
      if (next != "fini") {
        print("\nAppuyez sur une touche pour continuer..." + Couleur.reset());
        next = Fonction.saisirString();
      }
    }
  }
}
