import 'dart:io';

import 'package:flutter/material.dart';
import 'package:triton_fire_management_app/ui/widgets/information_app_bar.dart';
import 'package:triton_fire_management_app/ui/widgets/fire_management.dart';
import 'package:triton_fire_management_app/ui/widgets/fire_news.dart';
import 'package:triton_fire_management_app/ui/widgets/fire_report_button.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InformationAppBar(),
            FireManagement(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Recommended for you',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FireNews(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: isExpanded ? const Icon(Icons.close) : const Icon(Icons.add),
          ),
          const SizedBox(height: 16.0),
          if (isExpanded)
            FloatingActionButton(
              onPressed: () {
                // Handle the first expanded button's action
              },
              child: const Icon(Icons.call),
            ),
          const SizedBox(height: 16.0),
          if (isExpanded)
            FloatingActionButton(
              onPressed: () {
                // Handle the second expanded button's action
              },
              child: const Icon(Icons.question_mark_rounded),
            ),
        ],
      ),
    );
  }
}
