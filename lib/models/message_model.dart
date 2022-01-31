class Message{
  final String _text;
  final String _receiverEmail;
  final String _senderEmail;

  late DateTime _sendingDate;

  Message(this._text,this._receiverEmail,this._senderEmail){
    _sendingDate = DateTime.now();
  }

  String get text => _text;
  String get receiverEmail => _receiverEmail;
  String get senderEmail => _senderEmail;

  DateTime get sendingDate => _sendingDate;

  String sendingDateAsString(){
    return _sendingDate.toString().substring(0,16).replaceAll("-", "/").replaceFirst(" ",", ");
  }
}

