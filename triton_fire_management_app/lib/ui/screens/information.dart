import 'dart:io';

import 'package:flutter/material.dart';
import 'package:triton_fire_management_app/ui/widgets/information_app_bar.dart';
import 'package:triton_fire_management_app/ui/widgets/fire_management.dart';
import 'package:triton_fire_management_app/ui/widgets/fire_news.dart';
import 'package:triton_fire_management_app/ui/widgets/fire_report_button.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InformationAppBar(),
            Row(
              children: [],
            ),
            FireManagement(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Recommended for you',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            FireNews(),
          ],
        ),
      ),
      floatingActionButton: ReportFireButton(),
    );
  }
}
