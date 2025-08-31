class OrganizationDetailsModel {
  String id;
  String name;
  String slug;
  String domain;
  String? logo;
  List<ThemeItem> theme;

  OrganizationDetailsModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.domain,
    this.logo,
    required this.theme,
  });

  factory OrganizationDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrganizationDetailsModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      domain: json['domain'],
      logo: json['logo'],
      theme: (json['theme'] as List).map((e) => ThemeItem.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "slug": slug,
      "domain": domain,
      "logo": logo,
      "theme": theme.map((e) => e.toJson()).toList(),
    };
  }
}

class ThemeItem {
  String key;
  String value;

  ThemeItem({required this.key, required this.value});

  factory ThemeItem.fromJson(Map<String, dynamic> json) {
    return ThemeItem(key: json['key'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {"key": key, "value": value};
  }
}
