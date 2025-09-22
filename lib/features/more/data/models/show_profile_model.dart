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
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      photoUrl:
          json['photo_url'] is String
              ? json['photo_url'] as String
              : (json['photo_url']?['url'] as String?),
      photoInfo:
          json['photo_info'] is String
              ? json['photo_info'] as String
              : json['photo_info']?.toString(),
      phone: json['phone'] as String?,
      countryCode: json['country_code'] as String?,
      address: json['address'] as String?,
      countryId: json['country_id'] as int?,
      stateId: json['state_id'] as int?,
      city: json['city'] as String?,
      postalCode: json['postal_code'] as String?,
      isSocial: json['is_social'] as bool?,
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
