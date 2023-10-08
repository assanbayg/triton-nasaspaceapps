import 'package:flutter/material.dart';
import 'package:triton_fire_management_app/ui/widgets/search_bar.dart';

class InformationAppBar extends StatelessWidget {
  const InformationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: size.width,
        height: size.height / 4,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const ImageIcon(
                AssetImage('assets/fire_icon.png'),
                color: Colors.white,
                size: 60,
              ),
            ),
            const Text(
              'Fire Management',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SimpleSearchBar(
                controller: TextEditingController(), onSearch: (String s) {}),
          ],
        ),
      ),
    );
  }
}
