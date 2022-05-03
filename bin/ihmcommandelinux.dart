import 'dart:io';

import 'couleur.dart';
import 'fonction.dart';
import 'ip.dart';

class IHMCMDLINUX{
  static void afficheMenu() async {
    Couleur.effaceScreen();
    print(Couleur.green() + 
    "+---------------------------------------------+\n"+
    "| 1 - Ping une IP                             |\n"+
    "| 2 - Ajouter un nouvel utilisateur           |\n"+
    "| 3 - Voir dans quel répertoire où vous êtes  |\n"+
    "| 4 - Installation de CMS                     |\n"+
    "+---------------------------------------------+\n"+
    Couleur.reset()  
    );
    int choix = Fonction.saisirInt();
    while(choix!=1 && choix!=2 && choix!=3 && choix!=4 ){
      print(Couleur.rouge() + "Saisir une valeur valide !"+Couleur.reset());
      choix = Fonction.saisirInt();
    }
    if(choix == 1){
      print(Couleur.blue()+"Saisir une IP (0.0.0.0)"+Couleur.reset());
      String ip = Fonction.saisirString();
      IP ipvalide = new IP(ip);
      while(!ipvalide.ipValide()){
        print(Couleur.rouge() + "L'ip saisie n'est pas valide !"+Couleur.reset());
        ip = Fonction.saisirString();
        ipvalide.setIp(ip);
      }
      String cmd = "ping -c 3 " + ip;
      ProcessResult result = await Process.run('bash', ['-c', cmd]);
      Process.run('bash', ['-c', cmd]).then((result){
        if(result.stdout != null){
          print("nul");
        }
        print(result.stdout);
        print(result.stderr);
      });
      
  
    }

  }
}