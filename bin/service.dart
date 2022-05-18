import 'dart:io';

import 'bash.dart';

class Service{
  static Future<String> installApache() async{
    await Process.run('bash', ['-c','apt update -y' ]);
    //Installation de apache
    ProcessResult result = await Process.run('bash', ['-c','apt install apache2 && echo ' + BASH.getCode()]);
    String reponse = BASH.ligneSplit(result.stdout);
    return reponse; 
  }

  //A finir
  static Future<void> nouveauSite(String nomSite) async{
    await Process.run('bash', ['-c','cd /var/www/html && mkdir $nomSite' ]);
    await Process.run('bash', ['-c','']);
  }


}