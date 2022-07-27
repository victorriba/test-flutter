import 'dart:convert';

class Category {
  String id;
  String name;

 Category({
    required this.id,
    required this.name
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
    );
  }

  static List<Category> fromJsonList(List items) {
    return items.map((item) => Category.fromJson(item)).toList();
  }

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
      "id": id,
      "name": name,
  };  

  bool isEqual(Category model) {
    return id == model.id;
  }
}

class CategoryOpts {
  CategoryOpts({
    required this.search,
    required this.page,
    required this.limit,
    required this.from,
    required this.to,
  });
  String search;
  int page;
  int limit;
  String from;
  String to;

  Map<String, dynamic> toMap() => {
    "search": search,
    "page": page,
    "limit": limit,
    "from": from,
    "to": to,
  };
}

class CategoryResponse {
  CategoryResponse({
    required this.count,
    required this.list,
  });

  int count;
  List<Category> list;

  factory CategoryResponse.fromJson(String str) =>
      CategoryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryResponse.fromMap(Map<String, dynamic> json) =>
      CategoryResponse(
        count: json["count"],
        list: List<Category>.from(
            json["list"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
       "count": count,
       "list": List<dynamic>.from(list.map((x) => x.toMap())),
  };  
}