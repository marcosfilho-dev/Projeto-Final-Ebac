class UserModel {
final String login;
final String firstName;
final String lastName;
final String nickName;
final String password;

UserModel ({
required this.login,
required this.firstName,
required this.lastName,
required this.nickName,
required this.password,
});


 Map<String, dynamic> toJson () {
return {
  'login': login,
  'firstName': firstName,
  'lastName': lastName,
  'nickName': nickName,
  'password': password,
  };
 }
 factory UserModel.fromJson(Map<String, dynamic> map) {
 return UserModel(
  login: map ['login'] ?? '',
  firstName: map['firstName'] ?? '',
  lastName: map ['lastName'] ?? '',
  nickName: map['nickName'] ?? '',
  password: map['password'] ?? '',
 );
 }
 @override
 String toString() {
  return 'UserModel{login: $login, firstName: $firstName, lastName: $lastName, nickName: $nickName, password: $password)';
 }
}