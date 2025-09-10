class ShowProfileModel {
  final ProfileData? data;

  ShowProfileModel({this.data});

  factory ShowProfileModel.fromJson(Map<String, dynamic> json) {
    return ShowProfileModel(
      data: json['data'] != null ? ProfileData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'data': data?.toJson()};
  }
}

class ProfileData {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? photoUrl;
  final String? photoInfo;
  final String? phone;
  final String? countryCode;
  final String? address;
  final int? countryId;
  final int? stateId;
  final String? city;
  final String? postalCode;
  final bool? isSocial;

  ProfileData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.photoUrl,
    this.photoInfo,
    this.phone,
    this.countryCode,
    this.address,
    this.countryId,
    this.stateId,
    this.city,
    this.postalCode,
    this.isSocial,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      photoUrl: json['photo_url'],
      photoInfo: json['photo_info'],
      phone: json['phone'],
      countryCode: json['country_code'],
      address: json['address'],
      countryId: json['country_id'],
      stateId: json['state_id'],
      city: json['city'],
      postalCode: json['postal_code'],
      isSocial: json['is_social'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'photo_url': photoUrl,
      'photo_info': photoInfo,
      'phone': phone,
      'country_code': countryCode,
      'address': address,
      'country_id': countryId,
      'state_id': stateId,
      'city': city,
      'postal_code': postalCode,
      'is_social': isSocial,
    };
  }
}
