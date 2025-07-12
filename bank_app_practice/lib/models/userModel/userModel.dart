class UserModel {
  final String? userName;
  final String email;
  final String password;
  final String? occupation;
  final int? pin;
  final String? phoneNumber;
  final bool? isVerified;

  const UserModel({
    this.userName,
    this.occupation,
    this.phoneNumber,
    this.isVerified,
    required this.email,
    required this.password,
    required this.pin,
  });
}
