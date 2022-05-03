import 'couleur.dart';
import 'ihm.dart';
import 'ip.dart';

void main(List<String> arguments)async {
  IHM.afficheTitre();
  await Future.delayed(const Duration(seconds: 1));
  IHM.afficheMenu();

}
