import 'package:flutter/material.dart';
import 'package:triton_fire_management_app/ui/screens/ar_screen.dart';
import 'package:triton_fire_management_app/ui/screens/information.dart';
import 'package:triton_fire_management_app/ui/screens/map.dart';
import 'package:triton_fire_management_app/ui/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/nav-bar';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens = const [
    InformationScreen(),
    MapScreen(),
    ProfileScreen(),
    ArScreen(),
  ];

  Widget buildIcon(IconData icon) {
    return Icon(
      icon,
      size: MediaQuery.of(context).size.height * 0.04,
    );
  }

  Widget buildAssetIcon(String assetName) {
    return ImageIcon(
      AssetImage(assetName),
      size: MediaQuery.of(context).size.height * 0.03,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(96, 102, 80, 80),
                spreadRadius: 0,
                blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: (value) => setState(() {
              selectedIndex = value;
            }),
            items: [
              BottomNavigationBarItem(
                icon: buildAssetIcon('assets/icons/home.png'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: buildAssetIcon('assets/icons/map.png'),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: buildIcon(Icons.account_circle_rounded),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
