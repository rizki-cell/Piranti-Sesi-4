import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/controller/feed_controller.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:flutter_application_1/controller/photo_controller.dart';
import 'package:flutter_application_1/core/hive_storage.dart';
import 'package:flutter_application_1/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    HiveStorage.instance.initBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FeedController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhotoController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
      ],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
