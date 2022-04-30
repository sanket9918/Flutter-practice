import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
              hintText: "Search...",
              prefixIcon: Container(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset("assets/icons/search.svg"),
              ),
              contentPadding: const EdgeInsets.all(2)
            ),
      ),
    );
  }
}
