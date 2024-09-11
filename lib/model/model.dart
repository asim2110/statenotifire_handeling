class User {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;

  User({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      id: json['id'],
      nodeId: json['node_id'],
      avatarUrl: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'node_id': nodeId,
      'avatar_url': avatarUrl,
    };
  }
}
