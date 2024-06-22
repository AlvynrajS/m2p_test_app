class GetFromDataModel {
  List<Payload>? payload;
  int? resourceId;

  GetFromDataModel({this.payload, this.resourceId});

  GetFromDataModel.fromJson(Map<String, dynamic> json) {
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload!.add(new Payload.fromJson(v));
      });
    }
    resourceId = json['resourceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payload != null) {
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    data['resourceId'] = this.resourceId;
    return data;
  }
}

class Payload {
  int? id;
  String? name;
  String? value;

  Payload({this.id, this.name, this.value});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
