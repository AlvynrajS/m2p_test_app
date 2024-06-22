class LoginModel {
  Map<String, dynamic> changes;
  String resourceIdentifier;

  LoginModel({
    required this.changes,
    required this.resourceIdentifier,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      changes: json['changes'] ?? {},
      resourceIdentifier: json['resourceIdentifier'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'changes': changes,
      'resourceIdentifier': resourceIdentifier,
    };
  }
}
