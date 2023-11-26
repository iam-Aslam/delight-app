import 'package:flutter/material.dart';
import 'package:greatindian/view/profile_screen/profile_screen.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.person_2_outlined),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on_outlined),
            onPressed: () {
              // Add your trailing button onPressed logic here
              print('Trailing button pressed');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Hello'),
      ),
    ));
  }
}
