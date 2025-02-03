import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:flutter_application_1/view/feed_bookmark.dart';
import 'package:flutter_application_1/view/feed_list_widget.dart';
import 'package:flutter_application_1/view/profile_page.dart'; // Import ProfilePage
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bodies = const [
    FeedListWidget(),
    FeedListWidget(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OurApp',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        leading: const Icon(Icons.menu_rounded),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BookmarkPage(),
                ),
              );
            },
            icon: const Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      body: bodies[controller.selectedIndex], // Render sesuai tab
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_outline),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: controller.selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: (index) {
          controller.changeIndex(index);
        },
      ),
    );
  }
}
