import 'package:flutter/material.dart';
import 'package:triton_fire_management_app/ui/widgets/action.dart';

class FireActionScreen extends StatelessWidget {
  const FireActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0.0,
              right: 0.0,
              child: Image.asset(
                'assets/fire_action_corner.png',
                width: 300.0,
                height: 300.0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'FIRE ',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'ACTION',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  'If you discover or suspect fire',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        ActionWidget(
                          icon: Icons.phone_callback_rounded,
                          title: 'STEP 1',
                          description:
                              'Sound the alarm by operating The Nearest fire alarm call Point',
                          color: Colors.deepPurpleAccent[100]!,
                        ),
                        ActionWidget(
                          icon: Icons.fire_extinguisher,
                          title: 'STEP 2',
                          description:
                              'If possible tackle the fire with the appropriate fire fighting equipment',
                          color: Colors.amber!,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ActionWidget(
                          icon: Icons.phone_callback_rounded,
                          title: 'STEP 3',
                          description:
                              'Sound the alarm by operating The Nearest fire alarm call Point',
                          color: Colors.amber!,
                        ),
                        ActionWidget(
                          icon: Icons.fire_extinguisher,
                          title: 'STEP 4',
                          description:
                              'If possible tackle the fire with the appropriate fire fighting equipment',
                          color: Colors.deepPurpleAccent[100]!,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
