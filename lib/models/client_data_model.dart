import 'dart:convert';

class ClientDataModel {
  String username;
  int userId;
  String accessToken;
  bool authenticated;
  int officeId;
  String officeName;
  List<Role> roles;
  List<String> permissions;
  bool shouldRenewPassword;
  int clientId;

  ClientDataModel({
    required this.username,
    required this.userId,
    required this.accessToken,
    required this.authenticated,
    required this.officeId,
    required this.officeName,
    required this.roles,
    required this.permissions,
    required this.shouldRenewPassword,
    required this.clientId,
  });

  factory ClientDataModel.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return ClientDataModel(
      username: json['username'],
      userId: json['userId'],
      accessToken: json['accessToken'],
      authenticated: json['authenticated'],
      officeId: json['officeId'],
      officeName: json['officeName'],
      roles: List<Role>.from(json['roles'].map((x) => Role.fromJson(x))),
      permissions: List<String>.from(json['permissions']),
      shouldRenewPassword: json['shouldRenewPassword'],
      clientId: json['clientId'],
    );
  }
}

class Role {
  int id;
  String name;
  String description;
  bool disabled;
  List<dynamic> roleBasedLimits;

  Role({
    required this.id,
    required this.name,
    required this.description,
    required this.disabled,
    required this.roleBasedLimits,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      disabled: json['disabled'],
      roleBasedLimits: List<dynamic>.from(json['roleBasedLimits']),
    );
  }
}
