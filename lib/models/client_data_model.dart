class ClientDataModel {
  String? name;
  OriginalRequest? originalRequest;
  String? status;
  int? code;
  String? sPostmanPreviewlanguage;
  List<Header>? header;
  List<String>? cookie;
  Body? body;

  ClientDataModel(
      {this.name,
      this.originalRequest,
      this.status,
      this.code,
      this.sPostmanPreviewlanguage,
      this.header,
      this.cookie,
      this.body});

  ClientDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    originalRequest = json['originalRequest'] != null
        ? new OriginalRequest.fromJson(json['originalRequest'])
        : null;
    status = json['status'];
    code = json['code'];
    sPostmanPreviewlanguage = json['_postman_previewlanguage'];
    if (json['header'] != null) {
      header = <Header>[];
      json['header'].forEach((v) {
        header!.add(new Header.fromJson(v));
      });
    }
    if (json['cookie'] != null) {
      cookie = json['cookie'].cast<String>();
    }
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.originalRequest != null) {
      data['originalRequest'] = this.originalRequest!.toJson();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    data['_postman_previewlanguage'] = this.sPostmanPreviewlanguage;
    if (this.header != null) {
      data['header'] = this.header!.map((v) => v.toJson()).toList();
    }
    if (this.cookie != null) {
      data['cookie'] = this.cookie!;
    }
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class OriginalRequest {
  String? method;
  List<Header>? header;
  Url? url;

  OriginalRequest({this.method, this.header, this.url});

  OriginalRequest.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    if (json['header'] != null) {
      header = <Header>[];
      json['header'].forEach((v) {
        header!.add(new Header.fromJson(v));
      });
    }
    url = json['url'] != null ? new Url.fromJson(json['url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    if (this.header != null) {
      data['header'] = this.header!.map((v) => v.toJson()).toList();
    }
    if (this.url != null) {
      data['url'] = this.url!.toJson();
    }
    return data;
  }
}

class Header {
  String? key;
  String? value;

  Header({this.key, this.value});

  Header.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class Url {
  String? raw;
  List<String>? host;
  List<String>? path;
  List<Query>? query;

  Url({this.raw, this.host, this.path, this.query});

  Url.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    host = json['host'].cast<String>();
    path = json['path'].cast<String>();
    if (json['query'] != null) {
      query = <Query>[];
      json['query'].forEach((v) {
        query!.add(new Query.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['host'] = this.host;
    data['path'] = this.path;
    if (this.query != null) {
      data['query'] = this.query!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Query {
  String? key;
  String? value;

  Query({this.key, this.value});

  Query.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class Body {
  String? username;
  int? userId;
  String? accessToken;
  bool? authenticated;
  int? officeId;
  String? officeName;
  List<Roles>? roles;
  List<String>? permissions;
  bool? shouldRenewPassword;
  int? clientId;

  Body(
      {this.username,
      this.userId,
      this.accessToken,
      this.authenticated,
      this.officeId,
      this.officeName,
      this.roles,
      this.permissions,
      this.shouldRenewPassword,
      this.clientId});

  Body.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userId = json['userId'];
    accessToken = json['accessToken'];
    authenticated = json['authenticated'];
    officeId = json['officeId'];
    officeName = json['officeName'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    permissions = json['permissions'].cast<String>();
    shouldRenewPassword = json['shouldRenewPassword'];
    clientId = json['clientId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['userId'] = this.userId;
    data['accessToken'] = this.accessToken;
    data['authenticated'] = this.authenticated;
    data['officeId'] = this.officeId;
    data['officeName'] = this.officeName;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    data['permissions'] = this.permissions;
    data['shouldRenewPassword'] = this.shouldRenewPassword;
    data['clientId'] = this.clientId;
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? description;
  bool? disabled;
  List<String>? roleBasedLimits;

  Roles(
      {this.id,
      this.name,
      this.description,
      this.disabled,
      this.roleBasedLimits});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    disabled = json['disabled'];
    if (json['roleBasedLimits'] != null) {
      roleBasedLimits = json['roleBasedLimits'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['disabled'] = this.disabled;
    if (this.roleBasedLimits != null) {
      data['roleBasedLimits'] = this.roleBasedLimits!;
    }
    return data;
  }
}
