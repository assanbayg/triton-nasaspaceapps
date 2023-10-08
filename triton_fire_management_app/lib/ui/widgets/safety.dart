import 'package:flutter/material.dart';

class SafetyWidget extends StatelessWidget {
  final IconData icon;
  final bool state;
  final String description;
  final Color color;

  const SafetyWidget({
    super.key,
    required this.icon,
    required this.state,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.width / 2.5,
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
            color: Colors.white,
          ),
          Text(
            description,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
