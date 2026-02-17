import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/view_model/search/search_cubit.dart';
import 'package:movies_app/view_model/search/search_state.dart';
import 'package:movies_app/views/widgets/my_bottom_navigationbar.dart';
import 'package:movies_app/views/widgets/no_movies.dart';
import 'package:movies_app/views/widgets/search_textformfield.dart';
import 'package:movies_app/views/widgets/searched_movie.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            SearchTextFormField(readOnly: false),
            const SizedBox(height: 12),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }else if (state is SearchLoaded) {
                    return ListView.builder(
                      itemCount: state.searchedMovies.length,
                      itemBuilder: (context, index) =>
                          SearchedMovie(movie: state.searchedMovies[index]),
                    );
                  } else {
                    return const NoMovies();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        routeName: SearchScreen.routeName,
        currentIndex: 1,
      ),
    );
  }
}
