import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/nav-bar';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color color = Colors.white;
  var selectedIndex = 0;
  List<Widget> screens = [
    Placeholder(),
    Placeholder(),
    Placeholder(),
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
      appBar: AppBar(
        title: Text('Triton'),
      ),
      backgroundColor: color,
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Color.fromARGB(96, 102, 80, 80), spreadRadius: 0, blurRadius: 10),
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
              if (value == 3) {
                color = Color.fromRGBO(85, 139, 47, 1);
              } else
                color = Colors.white;
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
