import 'package:flutter/material.dart';
import 'package:movies_app/views/screens/home_screen.dart';
import 'package:movies_app/views/screens/search_screen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
    required this.routeName,
    required this.currentIndex,
  });

  final String routeName;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.blueAccent, width: 0.5)),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'watchlist',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,
        elevation: 0,
        onTap: (index) {
          if (index == 0 && currentIndex != 0) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
              (route) => false,
            );
          } else if (index == 1 && currentIndex != 1) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              SearchScreen.routeName,
              (route) => false,
            );
          }
          // else if (index == 2 && currentIndex != 2) {
          //   Navigator.pushNamedAndRemoveUntil(
          //     context,
          //     WatchlistScreen.routeName,
          //     (route) => false,
          //   );
          // }
        },
      ),
    );
  }
}
