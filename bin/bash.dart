import 'dart:io';

import 'couleur.dart';

class BASH{
  
  static Future<String> codeErreur() async{
    ProcessResult result = await Process.run('bash', ['-c', 'echo \$?']);
    String codeErreur = "";
    codeErreur = result.stdout;
    codeErreur = codeErreur.substring(0,1);
    print("Le code erreur est " + codeErreur);
    return codeErreur; 
  }

  static Future<void> ajoutUtilisateur(String nom) async{
    String cmd = "adduser -D " + nom;
    ProcessResult result = await Process.run('bash', ['-c', cmd]);
  }

  static Future<String> pwd() async{
    String cmd = "pwd";
    String reponse = "";
    ProcessResult result = await Process.run('bash',['-c',cmd]);
    print(result.stdout);
    String code = await codeErreur();
    print(code);
    if(code == "0"){
      reponse = result.stdout;
    }else{
      reponse = "Erreur";
    }
    return reponse;
  }
  static Future<void> ping(String ip) async{
      String cmd = "ping -c 3 " + ip;
      ProcessResult result = await Process.run('bash', ['-c', cmd]);  
  }
}