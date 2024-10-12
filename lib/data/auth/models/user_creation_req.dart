class UserCreationReq {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? gender;
  int? age;

  UserCreationReq(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
}
