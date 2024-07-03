class Devices {
  int? id;
  String? name;
  String? password;
  String? model;

  Devices({this.id, this.name, this.password, this.model});

  Devices.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        password = res["password"],
        model = res["model"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'model': model,
    };
  }
}
