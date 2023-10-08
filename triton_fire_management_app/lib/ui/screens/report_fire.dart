import 'package:flutter/material.dart';

class ReportFireScreen extends StatefulWidget {
  const ReportFireScreen({super.key});

  @override
  _ReportFireScreenState createState() => _ReportFireScreenState();
}

class _ReportFireScreenState extends State<ReportFireScreen> {
  int currentStage = 1; // Initial stage is 1
  String selectedFireType = '';
  String fireData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Fire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stage $currentStage: Select Fire Type',
              style: const TextStyle(fontSize: 20),
            ),
            if (currentStage == 1)
              Column(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      currentStage = 2; // Move to the next stage
                    }),
                    child: const Column(
                      children: [
                        Icon(Icons.alarm_add_rounded, size: 100),
                        Text('1st')
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      currentStage = 2; // Move to the next stage
                    }),
                    child: const Column(
                      children: [
                        Icon(Icons.alarm_add_rounded, size: 100),
                        Text('1st')
                      ],
                    ),
                  ),
                  
                ],
              ),
            if (currentStage == 2)
              Column(
                children: [
                  Text(
                    'Stage $currentStage: Enter Fire Data',
                    style: const TextStyle(fontSize: 18),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        fireData = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Describe the fire...',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle sending the report here.
                      // You can access selectedFireType and fireData for the report.
                      // This is a placeholder action.
                      print(
                          'Report sent: Type - $selectedFireType, Data - $fireData');
                    },
                    child: const Text('Send Report'),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            // Progress Indicator Line
            LinearProgressIndicator(
              value: currentStage / 2, // Divide by the total number of stages
            ),
          ],
        ),
      ),
    );
  }
}
