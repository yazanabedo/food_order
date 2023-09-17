class GetProfile {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? photo;
  int? age;

  GetProfile(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.photo,
      this.age});

  GetProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    photo = json['photo'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['photo'] = this.photo;
    data['age'] = this.age;
    return data;
  }
}
