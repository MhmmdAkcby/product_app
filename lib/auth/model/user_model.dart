import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final List<Users> users;

  const UserModel({required this.users});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var usersList = json['users'] as List;
    List<Users> users = usersList.map((user) => Users.fromJson(user)).toList();
    return UserModel(users: users);
  }

  @override
  List<Object?> get props => [users];
}

class Users extends Equatable {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String image;

  const Users(
      {required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.image});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [firstName, lastName, username, email, image];
}
