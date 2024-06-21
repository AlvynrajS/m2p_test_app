class AccessTokenModel {
  String? name;
  OriginalRequest? originalRequest;
  String? status;
  int? code;
  String? sPostmanPreviewlanguage;
  List<Header>? header;
  List<String>? cookie;
  String? body;

  AccessTokenModel(
      {this.name,
      this.originalRequest,
      this.status,
      this.code,
      this.sPostmanPreviewlanguage,
      this.header,
      this.cookie,
      this.body});

  AccessTokenModel.fromJson(Map<String, dynamic> json) {
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
    body = json['body'];
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
      data['cookie'] = this.cookie;
    }
    data['body'] = this.body;
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
  bool? disabled;

  Query({this.key, this.value, this.disabled});

  Query.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
    disabled = json['disabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    data['disabled'] = this.disabled;
    return data;
  }
}
