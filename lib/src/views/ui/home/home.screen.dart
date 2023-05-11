import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/views/mainHome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _currentIndex = 0;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 111, 109, 109),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: const MainHome(),
    );
  }
}
