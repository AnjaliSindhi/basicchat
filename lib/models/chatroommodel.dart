class ChatRoomModel{
    String? chatroomid;
    String? participants;

    ChatRoomModel({
      this.chatroomid,
      this.participants,
    });

    ChatRoomModel.fromMap(Map<String, dynamic>map){
      chatroomid = map["chatroomid"];
      participants = map["participants"];
    }

    Map<String, dynamic> toMap(){
      return{
        "chatroomid" : chatroomid,
        "participants" : participants,
      };
    }

}