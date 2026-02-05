import 'package:flutter/material.dart';

class HourlyForcastItem extends StatelessWidget {
  const HourlyForcastItem({
    super.key,
    required this.time,
    required this.icon,
    required this.tempValue,
  });

  final String time;
  final IconData icon;
  final double tempValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          spacing: 10,
          children: [
            Text(
              time,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Icon(icon, size: 32),
            Text(tempValue.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }
}
