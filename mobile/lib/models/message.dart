class Message {
  final int id;
  final int conversationId;
  final String messageOwner;
  final String messageDescription;

  Message({
    required this.id,
    required this.conversationId,
    required this.messageDescription,
    required this.messageOwner
  });
}