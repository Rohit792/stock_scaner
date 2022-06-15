enum Status { loading, completed, error }

class BaseResponse {
  int? id;
  String? name;
  String? tag;
  String? color;
  List<Criteria>? criteria;

  BaseResponse({this.id, this.name, this.tag, this.color, this.criteria});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    if (json['criteria'] != null) {
      criteria = <Criteria>[];
      json['criteria'].forEach((v) {
        criteria!.add(Criteria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tag'] = tag;
    data['color'] = color;
    if (criteria != null) {
      data['criteria'] = criteria!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Criteria {
  String? type;
  String? text;

  Criteria({this.type, this.text});

  Criteria.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['text'] = text;
    return data;
  }
}
