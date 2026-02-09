import 'package:flutter/material.dart';
import 'package:movies_app/views/widgets/search_textformfield.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('What do you want to watch?')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(child: SearchTextFormField(readOnly: true)),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bookmark_border),
      //       label: 'watchlist',
      //     ),
      //   ],
        // currentIndex: 1,
        // selectedItemColor: Colors.amber[800],
      // ),
    );
  }
}
