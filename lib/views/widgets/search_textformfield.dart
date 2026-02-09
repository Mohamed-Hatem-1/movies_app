import 'package:flutter/material.dart';
import 'package:movies_app/views/screens/search_screen.dart';

class SearchTextFormField extends StatelessWidget {
  final bool readOnly;
  const SearchTextFormField({super.key, required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: readOnly
          ? () => Navigator.pushNamed(
              context,
              SearchScreen.routeName,
            )
          : () {},
      decoration: InputDecoration(
        fillColor: Color(0xFF3A3F47),
        filled: true,
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.white70),
        suffixIcon: Icon(Icons.search, color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
