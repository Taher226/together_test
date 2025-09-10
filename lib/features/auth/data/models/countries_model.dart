/// ===== State Model =====
class StateModel {
  final int id;
  final String name;
  final int countryId;
  final String? createdAt;
  final String? updatedAt;
  final Map<String, dynamic>? localizations; // أدق من dynamic

  StateModel({
    required this.id,
    required this.name,
    required this.countryId,
    this.createdAt,
    this.updatedAt,
    this.localizations,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      countryId: json['country_id'] ?? 0,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      localizations:
          json['localizations'] is Map<String, dynamic>
              ? Map<String, dynamic>.from(json['localizations'])
              : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_id": countryId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "localizations": localizations,
  };
}

/// ===== Country Model =====
class CountryModel {
  final int id;
  final String name;
  final String shortname;
  final String phonecode; // احتفظنا به String
  final List<StateModel> states;

  CountryModel({
    required this.id,
    required this.name,
    required this.shortname,
    required this.phonecode,
    required this.states,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    final statesJson = json['states'];
    return CountryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      shortname: json['shortname']?.toString() ?? '',
      phonecode: json['phonecode']?.toString() ?? '', // toString() لأمان النوع
      states:
          (statesJson is List)
              ? statesJson.map((e) => StateModel.fromJson(e)).toList()
              : <StateModel>[],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "shortname": shortname,
    "phonecode": phonecode,
    "states": states.map((e) => e.toJson()).toList(),
  };
}

class CountriesModel {
  final List<CountryModel> data;

  CountriesModel({required this.data});

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    final raw = json['data'];
    final list = (raw is List) ? raw : <dynamic>[];
    return CountriesModel(
      data: list.map((e) => CountryModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data.map((e) => e.toJson()).toList(),
  };
}
