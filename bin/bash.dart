import 'dart:convert';
import 'dart:io';

import 'couleur.dart';

class BASH{
  static String ligneSplit(String lignes){
    List<String> leslignes = LineSplitter.split(lignes).toList();
    String laligne = leslignes[leslignes.length-1].substring(0,1);
    return laligne;
  }
  static String getCode(){
    String code = " ; echo \$?";
    return code;
  }
  
  static Future<String> mkdir(String nomDossier) async{
    String cmd = "mkdir $nomDossier";
    ProcessResult result = await Process.run('bash',['-c', cmd+getCode()]);
    return ligneSplit(result.stdout);
      }

  static Future<String> ajoutUtilisateur(String nom) async{
    String cmd = "adduser --disabled-password  " + nom;
    ProcessResult result = await Process.runSync('bash', ['-c', cmd+getCode()]);
    ligneSplit(result.stdout);
    return result.stdout;
  }

  static Future<String> pwd() async{
    String cmd = "pwd";
    String reponse = "";
    ProcessResult result = await Process.run('bash',['-c',cmd]);
    return result.stdout;
  }
  static Future<String> ping(String ip) async{
      String cmd = "ping -c 3 $ip";
      ProcessResult result = await Process.run('bash', ['-c', cmd+getCode()]);  
      return ligneSplit(result.stdout);
  }
}