import 'dart:io';
import 'bash.dart';
import 'couleur.dart';
import 'fonction.dart';
import 'ip.dart';

class IHMCMDLINUX{
  static void menu(){
    Couleur.effaceScreen();
    print(Couleur.green() + 
    "+--------------------------------------------------+\n"+
    "|                 Menu Commande Linux              |\n"+
    "|                                                  |\n"+
    "| 1 - Ping une IP                                  |\n"+
    "| 2 - Ajouter un nouvel utilisateur                |\n"+
    "| 3 - Voir dans quel répertoire où vous êtes       |\n"+
    "| 4 - Créer un dossier dans le répertoire courant  |\n"+
    "|                                                  |\n"+
    "| R - Retour                                       |\n"+
    "+--------------------------------------------------+\n"+
    Couleur.reset()  
    );
  }

  static Future<void> afficheMenu() async {
  bool valide = false;
    while(!valide){
    menu();
    String next = "";
    String choix = Fonction.saisirString();
    if(choix == "1"){
      print(Couleur.blue()+"Saisir une IP (0.0.0.0)"+Couleur.reset());
      String ip = Fonction.saisirString();
      IP ipvalide = new IP(ip);
      while(!ipvalide.ipValide()){
        print(Couleur.rouge() + "L'ip saisie n'est pas valide !"+Couleur.reset());
        ip = Fonction.saisirString();
        ipvalide.setIp(ip);
      }
      //Ping de l'ip voulu
      String reponse = await BASH.ping(ipvalide.getIp());
      if(reponse == "0"){
        print(Couleur.green() +"Le ping sur l'ip " +Couleur.blue()+ ip +Couleur.green()+" fonctionne !"+ Couleur.reset());
      }else{
        print(Couleur.rouge() + "Erreur dans le ping" + Couleur.reset());
      }
    }else if(choix == "2"){
      print(Couleur.blue() + "Saisir le nom de l'utilisateur " + Couleur.reset());
      String nom = Fonction.saisirString();
      await BASH.ajoutUtilisateur(nom);
      }else if(choix == "3"){
        String reponse = await BASH.pwd();
        print(Couleur.green() + "Vous êtes dans le répertoire : " + Couleur.blue() + reponse + Couleur.reset());
       


        }else if(choix == "4"){
          //Pour montrer ou l'utilisateur se situe
          String repertoire = await BASH.pwd();
          print(Couleur.green() + "Vous allez créer un dossier dans le répertoire "+Couleur.blue()+"$repertoire"+Couleur.reset() );

          //Saisie le l'utilisateur
          print(Couleur.blue() + "Saisir le nom du dossier"+Couleur.reset());
          String nomDossier = Fonction.saisirString();
          String reponse = await BASH.mkdir(nomDossier);
        
          if(reponse == "0"){
            print(Couleur.green() + "Succès" +Couleur.reset());
          }else{
             print(Couleur.rouge() + "Erreur dans la création du dossier" + Couleur.reset());
          }
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