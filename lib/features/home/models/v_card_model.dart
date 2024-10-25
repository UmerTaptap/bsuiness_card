import 'package:hive/hive.dart';
part 'v_card_model.g.dart';


@HiveType(typeId: 0)
class VCardModel extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String jobTitle;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String address;
  @HiveField(5)
  final String profileImageUrl;
  @HiveField(6)
  final String qrCodeUrl;

  VCardModel({
    required this.name,
    required this.jobTitle,
    required this.email,
    required this.phone,
    required this.address,
    required this.profileImageUrl,
    required this.qrCodeUrl,
  });

  factory VCardModel.fromJson(Map<String, dynamic> json) {
    return VCardModel(
      name: json['name'],
      jobTitle: json['jobTitle'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      profileImageUrl: json['profileImageUrl'],
      qrCodeUrl: json['qrCodeUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'jobTitle': jobTitle,
      'email': email,
      'phone': phone,
      'address': address,
      'profileImageUrl': profileImageUrl,
      'qrCodeUrl': qrCodeUrl,
    };
  }


}