import 'package:flutter/material.dart';

class SimpleSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearch;

  const SimpleSearchBar({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          controller: controller,
          onChanged: onSearch,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: 'Search...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
