// ignore_for_file: override_on_non_overriding_member

part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;
  static String? token;

  User(
      {this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.houseNumber,
      required this.phoneNumber,
      required this.city,
      required this.picturePath});

  // Factory User From JSON
  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        address: data['address'] ?? '',
        houseNumber: data['houseNumber'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        city: data['city'] ?? '',
        picturePath: data['profile_photo_url'] ?? '',
      );
  // ignore: prefer_const_constructors_in_immutables
  User copyWith(
      {int? id,
      String? name,
      String? email,
      String? address,
      String? houseNumber,
      String? phoneNumber,
      String? city,
      String? picturePath}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      houseNumber: houseNumber ?? this.houseNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      picturePath: picturePath ?? this.picturePath,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = User(
    id: 1,
    name: 'Jennie Kim',
    address: 'Jalan Jendral Sudirman',
    city: 'Bandung',
    houseNumber: '1234',
    phoneNumber: '08123456789',
    email: 'jennie.kim@blackpink.com',
    picturePath:
        'https://i.pinimg.com/474x/8a/f4/7e/8af47e18b14b741f6be2ae499d23fcbe.jpg');
