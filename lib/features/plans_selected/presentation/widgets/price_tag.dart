import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final double price;
  final String currency;

  const PriceTag({Key? key, required this.price, required this.currency})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF6B35)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$currency${price.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFF6B35),
        ),
      ),
    );
  }
}
