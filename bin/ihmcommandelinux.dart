import 'dart:io';

import 'bash.dart';
import 'couleur.dart';
import 'fonction.dart';
import 'ip.dart';

class IHMCMDLINUX{
  static void vueDuMenu(){
        Couleur.effaceScreen();
    print(Couleur.green() + 
    "+--------------------------------------------------+\n"+
    "| 1 - Ping une IP                                  |\n"+
    "| 2 - Ajouter un nouvel utilisateur                |\n"+
    "| 3 - Voir dans quel répertoire où vous êtes       |\n"+
    "| 4 - Créer un dossier dans le répertoire courant  |\n"+
    "| R - Retour                                       |\n"+
    "+--------------------------------------------------+\n"+
    Couleur.reset()  
    );
  }

  static Future<void> afficheMenu() async {
  bool valide = false;
  
    while(!valide){
    vueDuMenu();
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
      print("la reponse est " + reponse);
      if(reponse == "0"){
        print(Couleur.green() +"Le ping sur l'ip " +Couleur.blue()+ ip +Couleur.green()+" fonctionne !"+ Couleur.reset());
      }else{
        print(Couleur.rouge() + "Erreur dans le ping" + Couleur.reset());
      }
    }/*else if(choix == "2"){
      print(Couleur.blue() + "Saisir le nom de l'utilisateur " + Couleur.reset());
      String nom = Fonction.saisirString();
      await BASH.ajoutUtilisateur(nom);
      if(await BASH.codeErreur() == "0"){
        print(Couleur.green()+"Ajout de l'utilisateur " + nom + " réussi ! " + Couleur.reset());
      }else{
        print(Couleur.rouge() + "Erreur dans l'ajout de l'utilisateur" + Couleur.reset());
      }
      }*/else if(choix == "3"){
        String reponse = await BASH.pwd();
        String couleur = "";
        print(reponse);
        if(reponse != "0"){
          couleur = Couleur.rouge();
           print(Couleur.green() + "Erreur "+couleur + reponse+Couleur.reset());
        }else{
          couleur = Couleur.blue();
           print(Couleur.green() + "Vous êtes dans le répertoire : "+couleur + reponse+Couleur.reset());
        }
       


        }/*else if(choix == "4"){
          
          String repertoire = await BASH.pwd();
          print(Couleur.green() + "Vous allez créer un dossier dans le répertoire "+Couleur.blue()+"$repertoire"+Couleur.reset() );
          print(Couleur.blue() + "Saisir le nom du dossier");
          String nomDossier = Fonction.saisirString();
          await BASH.mkdir(nomDossier);
        
          if(await BASH.codeErreur() == "0"){
            print(Couleur.green() + "Succès" +Couleur.reset());
          }else{
             print(Couleur.rouge() + "Erreur dans la création du dossier" + Couleur.reset());
          }
        }*/else if(choix == "R"){
      valide = true;
    }else {
      print(Couleur.rouge()+"Saisir une valeur valide !" + Couleur.reset());
      choix = Fonction.saisirString();
    }
    await Future.delayed(const Duration(seconds: 5));
    }
  }
}