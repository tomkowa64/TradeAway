class Conversation {
  final int id;
  final String owner;
  final String client;
  final int transaction;

  Conversation({
    required this.id,
    required this.owner,
    required this.client,
    required this.transaction
  });
}