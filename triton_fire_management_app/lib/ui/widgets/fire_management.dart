import 'package:flutter/material.dart';
import 'package:triton_fire_management_app/ui/screens/fire_action.dart';
import 'package:triton_fire_management_app/ui/screens/fire_security.dart';

class FireManagement extends StatefulWidget {
  const FireManagement({super.key});

  @override
  State<FireManagement> createState() => _FireManagementState();
}

class _FireManagementState extends State<FireManagement> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 4,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: size.width / 2.25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 80,
                    child: Image.asset('assets/fire_action.png'),
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Steps',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('What to do in a fire'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const FireActionScreen();
                        }));
                      },
                      child: const Text('Start'))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              width: size.width / 2.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 80,
                    child: Image.asset('assets/fire_safety.png'),
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Steps',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'What to do in a fire',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const FireSecurityScreen();
                        }));
                      },
                      child: const Text('Start'))
                ],
              ),
            ),
          ]),
    );
  }
}
