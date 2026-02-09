import 'package:flutter/material.dart';
import 'package:movies_app/views/widgets/search_textformfield.dart';
import 'package:movies_app/views/widgets/searched_movie.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          children: [
            SearchTextFormField(readOnly: false),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SearchedMovie(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
