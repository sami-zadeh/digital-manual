class UserEntity {
  final String id;
  final int phoneNumber;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? nickName;
  final String? streetAddress;
  final String? state;
  final int? postalCode;
  final String? country;
  UserEntity({
    required this.id,
    required this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.nickName,
    this.streetAddress,
    this.state,
    this.postalCode,
    this.country,
  });
}
