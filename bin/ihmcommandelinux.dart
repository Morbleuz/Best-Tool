import 'dart:io';

import 'bash.dart';
import 'couleur.dart';
import 'fonction.dart';
import 'ip.dart';

class IHMCMDLINUX{
  static void vueDuMenu(){
        Couleur.effaceScreen();
    print(Couleur.green() + 
    "+---------------------------------------------+\n"+
    "| 1 - Ping une IP                             |\n"+
    "| 2 - Ajouter un nouvel utilisateur           |\n"+
    "| 3 - Voir dans quel répertoire où vous êtes  |\n"+
    "| 4 - Installation de CMS                     |\n"+
    "| R - Retour                                  |\n"+
    "+---------------------------------------------+\n"+
    Couleur.reset()  
    );
  }

  static Future<void> afficheMenu() async {
    bool valide = false;
    while(!valide){
    vueDuMenu();
    String choix = Fonction.saisirString();
    while(choix!="1" && choix!="2" && choix!="3" && choix!="4" && choix!="R"){
      print(Couleur.rouge() + "Saisir une valeur valide !"+Couleur.reset());
      choix = Fonction.saisirString();
    }
    if(choix == "1"){
      print(Couleur.blue()+"Saisir une IP (0.0.0.0)"+Couleur.reset());
      String ip = Fonction.saisirString();
      IP ipvalide = new IP(ip);
      while(!ipvalide.ipValide()){
        print(Couleur.rouge() + "L'ip saisie n'est pas valide !"+Couleur.reset());
        ip = Fonction.saisirString();
        ipvalide.setIp(ip);
      }
      await BASH.ping(ipvalide.getIp());
      String codeErreur = await BASH.codeErreur();
      print(codeErreur);
      print("la taile "+ codeErreur.length.toString());
      if(codeErreur == "0"){
        print(Couleur.green() +"Le ping sur l'ip " +Couleur.blue()+ ip +Couleur.green()+" fonctionne !"+ Couleur.reset());
      }else{
        print(Couleur.rouge() + "Erreur dans le ping" + Couleur.reset());
      }
      
    }else if(choix == "2"){
      print(Couleur.blue() + "Saisir le nom de l'utilisateur " + Couleur.reset());
      String nom = Fonction.saisirString();
      await BASH.ajoutUtilisateur(nom);
      if(await BASH.codeErreur() == "0"){
        print(Couleur.green()+"Ajout de l'utilisateur " + nom + " réussi ! " + Couleur.reset());
      }else{
        print(Couleur.rouge() + "Erreur dans l'ajout de l'utilisateur" + Couleur.reset());
      }
      }else if(choix == "3"){
        String reponse = await BASH.pwd();
        reponse = await BASH.pwd();
        String couleur = "";
        if(reponse == "Erreur"){
          couleur = Couleur.rouge();
        }else{
          couleur = Couleur.blue();
        }
        print(Couleur.green() + "Vous êtes dans le répertoire : "+couleur + reponse+Couleur.reset());


        }else if(choix == "R"){
      valide = true;
    }
    await Future.delayed(const Duration(seconds: 2));
    }
  }
}