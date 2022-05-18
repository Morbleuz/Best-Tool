import 'dart:io';

class Fonction{
  static String saisirString(){
    bool valide = false;
    String a = "";
    while(!valide){
      try{
          a = stdin.readLineSync().toString();
          valide = true;

      }catch(e){
        print("Erreur dans la saisie");
      }
    }
    return a;
  }

  static String saisirMdp(){
    stdin.echoMode = false;
    String mdp = saisirString();
    stdin.echoMode = true;
    return mdp;
  }
  
  static double sairsirDouble(){
    bool valide = false;
    double a = 0;
    while(!valide){
      try{
        a = double.parse(stdin.readLineSync().toString());
        valide = true;
      }catch(e){
        print("Erreur dans la saisie");
      }
    }
    return a;
  }

  static int saisirInt(){
    bool valide = false;
    int a = 0;
    while(!valide){
      try{
        a = int.parse(stdin.readLineSync().toString());
        valide = true;
      }catch(e){
        print("Erreur dans la saisie");
      }
    }
    return a;
  }
}