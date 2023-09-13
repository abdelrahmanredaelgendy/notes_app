import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon});
   final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 46,
      height: 46,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
