import 'bash.dart';
import 'couleur.dart';
import 'ihm.dart';
import 'ip.dart';

void main(List<String> arguments)async {
  //On vérifier que l'utilisateur est bien connecté en root 
  if(await BASH.estRoot()){
    await IHM.afficheTitre();
    await IHM.afficheMenu();
  }else{
    IHM.messageNonRoot();
  }

}
