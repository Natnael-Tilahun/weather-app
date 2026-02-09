import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  const AdditionalInfoItem({
    super.key,
    required this.icon,
    required this.tempratureType,
    required this.tempratureValue,
  });

  final IconData icon;
  final String tempratureType;
  final String tempratureValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Icon(icon, size: 32),
        Text(tempratureType),
        Text(
          tempratureValue,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
