class OrganizationsModel {
  String id;
  String name;
  String? logo;

  OrganizationsModel({required this.id, required this.name, this.logo});
  factory OrganizationsModel.fromJson(Map<String, dynamic> json) {
    return OrganizationsModel(
      id: json['id'].toString(),
      name: json['name'],
      logo: json['logo'],
    );
  }
  Map<String, dynamic> toJson() => {"id": id, "name": name, "logo": logo};
}
