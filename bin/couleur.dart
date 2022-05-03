import 'dart:io';

class Couleur {
  static String reset() {
    String blanc = "\x1B[0m";
    return blanc;
  }
    
  static String blue(){
    String blue = "\x1B[34m";
    return blue;
  }
  static String green(){
    String green = "\x1B[32m";
    return green;
  }
  static String rouge() {
    String rouge = "\x1B[31m";
    return rouge;
  }

  static void effaceScreen() {
    stdout.write("\x1B[2J\x1B[0;0H");
  }
}
