class IP {
  String _ip = "";

  IP(this._ip);

  void setIp(String ip) {
    this._ip = ip;
  }

  String getIp() {
    return this._ip;
  }

  bool ipValide() {
    bool valide = true;
    int nbPoint = 0;
    List<String> lesNombres = this._ip.split('.');
    if (lesNombres.length == 4) {
      for (String nombre in lesNombres) {
        try {
          int nbParse = int.parse(nombre);
          if (nbParse > 0 && nbParse < 255) {
          } else {
            valide = false;
          }
        } catch (e) {
          valide = false;
        }
      }
    } else {
      valide = false;
    }
    return valide;
  }
}
