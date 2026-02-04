import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String userId;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? governorate;
  const MyUserEntity({
    required this.userId,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.governorate,
  });
  Map<String, Object?> toDocument() {
    return {'userId': userId, 'name': name, 'email': email, 'phone': phone, 'address': address, 'governorate': governorate};
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(userId: doc['userId'], name: doc['name'], email: doc['email'], phone: doc['phone'], address: doc['address'], governorate: doc['governorate']);
  }

  @override
  List<Object?> get props => [userId, email, name, phone, address, governorate];
}
