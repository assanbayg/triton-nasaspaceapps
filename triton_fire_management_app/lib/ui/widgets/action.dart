import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const ActionWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      height: MediaQuery.of(context).size.width / 2.2,
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
            title,
            style: TextStyle(color: Colors.white),
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
