class MessageModel{
  String? sender;
  String? text;
  bool? seen;
  DateTime? createdon;

  MessageModel({
    this.sender, this.text, this.seen, this.createdon
  });

  MessageModel.fromMap(Map<String, dynamic>map){
    sender = map["sender"];
    text = map["text"];
  }

}