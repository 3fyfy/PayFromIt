class Governmet {
  int id;
  String nameAr;
  String nameEn;
  List<Cities> cities;

  Governmet({this.id, this.nameAr, this.nameEn, this.cities});

  Governmet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    if (json['cities'] != null) {
      cities = new List<Cities>();
      json['cities'].forEach((v) {
        cities.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  int id;
  int idCountry;
  String nameAr;
  String nameEn;

  Cities({this.id, this.idCountry, this.nameAr, this.nameEn});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCountry = json['id_country'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_country'] = this.idCountry;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    return data;
  }
}