import 'package:flutter/material.dart';

class MovieDetailInfo extends StatelessWidget {
  final String label;
  final String value;

  const MovieDetailInfo({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 5),
          Text(value),
        ],
      ),
    );
  }
}
