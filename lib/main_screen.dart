import 'package:flutter/material.dart';
import 'package:gatech/views/game_screen/game_screen.dart';
import 'package:gatech/views/home_screen/home_screen.dart';
import 'package:gatech/views/profil_screen.dart';
import 'package:gatech/views/tech_screen/tech_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          margin:
              const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 10),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                selectedColor: Colors.teal),
            SalomonBottomBarItem(
                icon: const Icon(Icons.computer_outlined),
                title: const Text("Tech Info"),
                selectedColor: Colors.purple),
            SalomonBottomBarItem(
                icon: const Icon(Icons.gamepad_outlined),
                title: const Text("Game Info"),
                selectedColor: Colors.orange),
            SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                title: const Text("Profile"),
                selectedColor: Colors.lightBlueAccent)
          ],
        ),
        // body: DiscoverWidget(scrollController: _scrollController, images: images)
        body: viewHome(_currentIndex));
  }
}

Widget viewHome(index) {
  if (index == 0) {
    return const HomeScreen();
  } else if (index == 1) {
    return const TechScreen();
  } else if (index == 2) {
    return const GameScreen();
  } else if (index == 3) {
    return ProfilScreen();
  }
  return const Text('');
}
