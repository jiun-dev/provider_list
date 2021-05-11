class People {
  String name;
  String birth;

  People({this.birth, this.name});

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      birth: json['birth'] as String,
      name: json['name'] as String,
    );
  }
}