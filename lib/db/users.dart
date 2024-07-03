class Users {
  int? id;
  String? password;
  String? autologin;
  String? pattern;
  String? language;

  Users({this.id, this.password, this.autologin, this.pattern, this.language});

  /*
  { 'name':'Tosinso',
    'number':20
  }
   */

  Users.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        password = res["password"],
        autologin = res["autologin"],
        pattern = res["pattern"],
        language = res["language"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'password': password,
      'autologin': autologin,
      'pattern': pattern,
      'language': language,
    };
  }
}
