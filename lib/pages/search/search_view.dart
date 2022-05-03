
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
      child: SizedBox(
        height: 30.0,
        child: TextField(
          keyboardType: TextInputType.text,
          style: const TextStyle(
            fontSize: 12,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 15.0),
            hintText: 'Искать товар',
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white10,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(35.0),
            ),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: secondColor,
              size: 18.0,
            ),
            filled: true,
          ),
        ),
      ),
    );
  }
}