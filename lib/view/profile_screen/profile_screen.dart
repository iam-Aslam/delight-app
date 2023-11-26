import 'package:flutter/material.dart';
import 'package:greatindian/controller/user_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Profile Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => EditProfile(
          //               passValueProfile: passValue,
          //               index: passId,
          //             )));
        },
        child: const Icon(Icons.edit_outlined),
      ),
      body: FutureBuilder(
        future: Provider.of<UserProvider>(context, listen: false).getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Consumer<UserProvider>(
              builder: (context, value, child) {
                if (value.userName != null) {
                  return Center(
                    child: Card(
                      color: Colors.amberAccent,
                      margin: const EdgeInsets.all(16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 16.0),
                            Text(
                              value.userName ?? 'NO Name',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              value.userEmail ?? 'No Email Added',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              value.userCompany ?? 'No Company ',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              value.userPlace ?? 'No Place',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: Text('User details not found.'));
                }
              },
            );
          }
        },
      ),
    );
  }
}
