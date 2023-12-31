import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:greatindian/controller/auth_provider.dart';
import 'package:greatindian/controller/location_provider.dart';
import 'package:greatindian/controller/product_provider.dart';
import 'package:greatindian/controller/user_provider.dart';
import 'package:greatindian/view/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
