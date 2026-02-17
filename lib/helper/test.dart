import 'package:flutter/material.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4, // Now playing, Upcoming, Top rated, Popular
        child: Scaffold(
          appBar: AppBar(
            title: Text("Movies"),
            bottom: TabBar(
              tabs: [
                Tab(text: "Now playing"),
                Tab(text: "Upcoming"),
                Tab(text: "Top rated"),
                Tab(text: "Popular"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MovieGrid(category: "Now playing"),
              MovieGrid(category: "Upcoming"),
              MovieGrid(category: "Top rated"),
              MovieGrid(category: "Popular"),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Watch list"),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieGrid extends StatelessWidget {
  final String category;
  MovieGrid({required this.category});

  final List<String> posters = [
    "assets/images/movie-1.png",
    "assets/images/movie-1.png",
    "assets/images/movie-1.png",
    "assets/images/movie-1.png",
    "assets/images/movie-1.png",
    "assets/images/movie-1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // two posters per row
        childAspectRatio: 0.7, // poster aspect ratio
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: posters.length,
      itemBuilder: (context, index) {
        return Card(
          child: Image.asset(posters[index], fit: BoxFit.cover),
        );
      },
    );
  }
}
