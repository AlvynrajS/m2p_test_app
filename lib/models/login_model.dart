class LoginModel {
  String? name;
  OriginalRequest? originalRequest;
  String? nPostmanPreviewlanguage;
  Header? header;
  List<String>? cookie;
  String? body;

  LoginModel(
      {this.name,
      this.originalRequest,
      this.nPostmanPreviewlanguage,
      this.header,
      this.cookie,
      this.body});

  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    originalRequest = json['originalRequest'] != null
        ? new OriginalRequest.fromJson(json['originalRequest'])
        : null;
    nPostmanPreviewlanguage = json['_postman_previewlanguage'];
    header = json['header'];
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
    data['_postman_previewlanguage'] = this.nPostmanPreviewlanguage;
    data['header'] = this.header;
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
  Body? body;
  Url? url;

  OriginalRequest({this.method, this.header, this.body, this.url});

  OriginalRequest.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    if (json['header'] != null) {
      header = <Header>[];
      json['header'].forEach((v) {
        header!.add(new Header.fromJson(v));
      });
    }
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    url = json['url'] != null ? new Url.fromJson(json['url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    if (this.header != null) {
      data['header'] = this.header!.map((v) => v.toJson()).toList();
    }
    if (this.body != null) {
      data['body'] = this.body!.toJson();
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

class Body {
  String? mode;
  String? raw;

  Body({this.mode, this.raw});

  Body.fromJson(Map<String, dynamic> json) {
    mode = json['mode'];
    raw = json['raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mode'] = this.mode;
    data['raw'] = this.raw;
    return data;
  }
}

class Url {
  String? raw;
  String? protocol;
  List<String>? host;
  String? port;
  List<String>? path;

  Url({this.raw, this.protocol, this.host, this.port, this.path});

  Url.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    protocol = json['protocol'];
    host = json['host'].cast<String>();
    port = json['port'];
    path = json['path'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['protocol'] = this.protocol;
    data['host'] = this.host;
    data['port'] = this.port;
    data['path'] = this.path;
    return data;
  }
}
