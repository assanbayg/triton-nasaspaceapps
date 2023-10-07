import 'package:flutter/material.dart';
import 'package:triton_fire_management_app/ui/widgets/fire_management.dart';
import 'package:triton_fire_management_app/ui/widgets/fire_news.dart';
import 'package:triton_fire_management_app/ui/widgets/fire_report_button.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return const Column(children: [
      Text('News', style: TextStyle(fontSize: 20)),
      FireNews(),
      Text('Learn', style: TextStyle(fontSize: 20)),
      FireManagement(),
      ReportFireButton(),
    ]);
  }
}
