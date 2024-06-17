import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1d1617).withOpacity(.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: TextField(
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(LineIcons.search, color: Colors.black38),
          suffixIcon: const Icon(Icons.tune, color: Colors.black38),
          // suffixIcon: const Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     VerticalDivider(
          //       color: Colors.black,
          //       indent: 10,
          //       endIndent: 10,
          //       thickness: 0.3,
          //     ),
          //     Padding(
          //       padding: EdgeInsets.all(8.0),
          //       child: Icon(Icons.tune, color: Colors.black38),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
