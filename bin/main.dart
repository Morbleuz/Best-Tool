import 'couleur.dart';
import 'ihm.dart';

void main(List<String> arguments) {
  IHM.afficheTitre();
  print(Couleur.rouge() + "Bienvenue sur l'outil " + Couleur.reset());
}
