import 'package:business_card_app/core/custom/sizes/paddings.dart';
import 'package:business_card_app/core/globals/app_images.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BusinessCard extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String email;
  final String phone;
  final String address;
  final String profileImageUrl; // URL for profile image
  final String qrCodeUrl; // URL for QR code image
  final bool isSingleCard;

  const BusinessCard({
    Key? key,
    required this.name,
    required this.jobTitle,
    required this.email,
    required this.phone,
    required this.address,
    required this.profileImageUrl,
    required this.qrCodeUrl,
    this.isSingleCard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSingleCard ? 0 : 5,
      color: isSingleCard ? Colors.transparent : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        margin: isSingleCard ? const EdgeInsets.all(20) : null,
        width: double.infinity,
        height: isSingleCard ? 370 : 400,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture and name section
            Row(
              children: [
                // Circle avatar
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    AppImages.man,
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    Text(
                      jobTitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Contact information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Contact details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.email, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(email, style: const TextStyle(color: Colors.white,overflow: TextOverflow.visible,)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(phone, style: const TextStyle(color: Colors.white,overflow: TextOverflow.visible,)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(address, style: const TextStyle(color: Colors.white,overflow: TextOverflow.visible,)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // QR code
            15.ph,
            Align(
              alignment: Alignment.center,
              child: QrImageView(
                data: qrCodeUrl,
                version: QrVersions.auto,
                size: 100.0,
              )
            ),
          ],
        ),
      ),
    );
  }
}