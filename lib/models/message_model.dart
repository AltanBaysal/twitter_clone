


class Message{
  final String _text;
  final String _emailWhoSent;

  late DateTime _sendingDate;

  Message(this._text,this._emailWhoSent){
    _sendingDate = DateTime.now();
  }

  String get text => _text;
  String get emailWhoSent => _emailWhoSent;
  DateTime get sendingDate => _sendingDate;

  String sendingDateAsString(){
    return _sendingDate.toString().substring(0,16).replaceAll("-", "/").replaceFirst(" ",", ");
  }
}

