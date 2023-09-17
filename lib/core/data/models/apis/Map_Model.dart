class Map_Model {
  String? country;
  String? alpha2;
  String? alpha3;
  int? numeric;
  dynamic? latitude;
  dynamic? longitude;

  Map_Model(
      {this.country,
      this.alpha2,
      this.alpha3,
      this.numeric,
      this.latitude,
      this.longitude});

  Map_Model.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    alpha2 = json['alpha2'];
    alpha3 = json['alpha3'];
    numeric = json['numeric'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['alpha2'] = this.alpha2;
    data['alpha3'] = this.alpha3;
    data['numeric'] = this.numeric;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
