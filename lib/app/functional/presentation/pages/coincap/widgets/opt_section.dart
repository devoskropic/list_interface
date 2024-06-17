// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:list_interface/app/functional/domain/provider/coincap/imports.dart';
import 'package:provider/provider.dart';

import 'package:list_interface/app/functional/domain/models/crypto/options_model.dart';
// import 'package:list_interface/app/functional/domain/provider/coincap/local_provider.dart';

class OptionSection extends StatelessWidget {
  final Function(int, CoincapProvider, String)? onTap;

  OptionSection({super.key, this.onTap});

  final List<OptionsModel> optionz = OptionsModel.getOptions();

  // _onOptionTap(int index, CoincapProvider provi, String id) {
  //   if (kDebugMode) {
  //     print("index | previous: ${provi.index}, future: $index");
  //   }
  //   provi.switchIndex(index, id);
  // }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<CoincapProvider>();

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
            itemCount: optionz.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => appState.switchIndex(
                  index,
                  optionz[index].title,
                ), // from  CoincapProvider
                // onTap: () => _onOptionTap(index, appState, optionz[index].title), // from local file
                child: Container(
                  width: 85,
                  decoration: BoxDecoration(
                    color: optionz[index].boxColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          optionz[index].iconPath,
                        ),
                      ),
                      Text(optionz[index].title),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
