import 'package:equatable/equatable.dart';

class ShowProfileEntity extends Equatable {
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

  const ShowProfileEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.photoUrl,
    this.photoInfo,
    this.address,
    this.city,
    this.countryCode,
    this.countryId,
    this.isSocial,
    this.phone,
    this.postalCode,
    this.stateId,
  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    photoUrl,
    photoInfo,
    address,
    city,
    countryCode,
    countryId,
    isSocial,
    phone,
    postalCode,
    stateId,
  ];
}
