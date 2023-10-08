import 'package:flutter/material.dart';
import 'package:triton_fire_management_app/ui/screens/report_fire.dart';

class ReportFireButton extends StatelessWidget {
  const ReportFireButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const ReportFireScreen();
            },
          ));
        },
        child: const Text('Report'));
  }
}
