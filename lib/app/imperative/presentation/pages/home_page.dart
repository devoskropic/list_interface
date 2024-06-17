// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:list_interface/app/functional/domain/models/general/imports.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<CustomerModel> options = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    options = CustomerModel.getOptions();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          searchField(),
          const SizedBox(height: 20),
          categorySection(theme),
          const SizedBox(height: 20),
          customerOptions(theme),
          const SizedBox(height: 20),
          verticalViews(theme),
        ],
      ),
    );
  }

  Column verticalViews(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Vertical views",
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 15),
        ListView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("Hello"),
            ),
            const SizedBox(height: 15),
            ListTile(
              style: theme.listTileTheme.style,
              // tileColor: Colors.black12,
              title: const Text("List tile one"),
              subtitle: const Text("Of many possibly"),
              trailing: IconButton(
                onPressed: () {},
                iconSize: 40,
                icon: const Icon(Icons.one_k_plus),
              ),
            ),
            const SizedBox(height: 15),
            ListTile(
              style: theme.listTileTheme.style,
              // tileColor: Colors.black12,
              title: const Text("List tile two"),
              subtitle: const Text("this is partial"),
              trailing: IconButton(
                onPressed: () {},
                iconSize: 40,
                icon: const Icon(Icons.one_k_plus),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ],
    );
  }

  Column customerOptions(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Customer options',
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          color: Colors.transparent,
          height: 240,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemCount: options.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return Container(
                width: 185,
                decoration: BoxDecoration(
                    color: options[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Icon and its background
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        options[index].iconPath,
                      ),
                    ),
                    // Title - subtitle
                    Column(
                      children: [
                        Text(
                          options[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text(
                          options[index].refers,
                          style: const TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    // View button
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            options[index].viewIsSelected
                                ? const Color(0xff9DCEFF)
                                : Colors.tealAccent.shade400,
                            options[index].viewIsSelected
                                ? const Color(0xff92A3FD)
                                : Colors.teal.shade100,
                          ]),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                              color: options[index].viewIsSelected
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Column categorySection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Quick menu",
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 110,
          color: Colors.transparent,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              return Container(
                width: 85,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        categories[index].iconPath,
                      ),
                    ),
                    Text(categories[index].title),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container searchField() {
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

  AppBar appBar() {
    return AppBar(
      // backgroundColor: Colors.white,
      title: const Text("Dummyland"),
      leadingWidth: 50, //default is 56
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: const Icon(Icons.navigate_before),
      //   tooltip: 'Back',
      // ),
      //   leading: Container(
      //   margin: const EdgeInsets.all(10),
      //   alignment: Alignment.center,
      //   // decoration: BoxDecoration(
      //   //   borderRadius: BorderRadius.circular(50),
      //   // ),
      //   child: IconButton(
      //     onPressed: () {},
      //     icon: const Icon(Icons.navigate_before),
      //   ),
      // ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(LineIcons.verticalEllipsis),
                tooltip: "Options",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
