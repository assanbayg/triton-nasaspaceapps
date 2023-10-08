import 'package:flutter/material.dart';
import 'package:triton_fire_management_app/ui/widgets/Safety.dart';

class FireSecurityScreen extends StatelessWidget {
  const FireSecurityScreen({super.key});

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
                'assets/fire_safety_corner.png',
                width: 300.0,
                height: 300.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
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
                        'SAFETY',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'If you discover or suspect fire',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SafetyWidget(
                              icon: Icons.outlet,
                              description: 'Seal all unused electrical outlets',
                              color: Colors.deepPurpleAccent[100]!,
                              state: true,
                            ),
                            SafetyWidget(
                              icon: Icons.charging_station_outlined,
                              description: 'Pull a plug out with its cord',
                              color: Colors.amber!,
                              state: false,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SafetyWidget(
                              icon: Icons.connect_without_contact,
                              description:
                                  'Throw away or repair electrical items that have damaged cords',
                              color: Colors.amber!,
                              state: true,
                            ),
                            SafetyWidget(
                              icon: Icons.warning,
                              description:
                                  'Touch electrical appliances with wet hands',
                              color: Colors.deepPurpleAccent[100]!,
                              state: false,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SafetyWidget(
                              icon: Icons.change_circle,
                              description:
                                  'Before repairing any electrical appliances, remember to unplug it',
                              color: Colors.deepPurpleAccent[100]!,
                              state: true,
                            ),
                            SafetyWidget(
                              icon: Icons.water_drop_rounded,
                              description:
                                  'Use any kind of electrical appliances close to water',
                              color: Colors.amber!,
                              state: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
