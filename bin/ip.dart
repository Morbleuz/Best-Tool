class IP{
  String _ip = "192.168.12.13";

  IP(this._ip);

  void setIp(String ip){
    this._ip = ip;
  }
  bool ipValide(){
    bool valide = false;
    int nbPoint = 0;
    for(int i = 0; i < this._ip.length; i++){
      if(i < this._ip.length){
        if(this._ip.substring(i,i+1) == "."){
                nbPoint++;
              };
      }
      
    }
    if(nbPoint == 3 && this._ip.length<16){
      valide = true;
    }
    return valide;
  }
}