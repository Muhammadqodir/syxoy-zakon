import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/models/menu_item.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';
import 'package:suxoy_zakon/widgets/cart.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/custom_tabs.dart';
import 'package:suxoy_zakon/widgets/menu_position.dart';
import 'package:suxoy_zakon/widgets/static_grid.dart';

class ContentMain extends StatefulWidget {
  const ContentMain({super.key});

  @override
  State<ContentMain> createState() => _ContentMainState();
}

class _ContentMainState extends State<ContentMain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fillData();
  }

  List<String> categoriesList = ["Все"];
  List<MenuItem> items = [];

  _fillData() async {
    Api api = Api();

    Response<List<String>> categories = await api.getCategories();
    if (categories.success) {
      categoriesList = ["Все"];
      categoriesList.addAll(categories.data!);
    }

    Response<List<MenuItem>> menuRes = await api.getAllMenu();
    if (menuRes.success) {
      items = menuRes.data!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            _fillData();
          },
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                Stack(
                  children: [
                    getBgCover(),
                    SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CartWidget()
                                  ],
                                ),
                                const SizedBox(
                                  height: 52,
                                ),
                                Container(
                                  height: 167,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Сухой ЗаконЪ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(fontSize: 26),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                CustomBtn(
                                  onTap: () {},
                                  height: 40,
                                  accentColor: const Color(0xFFF9F9F9),
                                  text: "найди себе блюдо",
                                  alignment: MainAxisAlignment.start,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: textColor.withOpacity(0.7)),
                                  icon: Icon(
                                    CupertinoIcons.search,
                                    size: 20,
                                    color: textColor.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomTabs(
                            tabs: categoriesList,
                            onChanged: (index) {},
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          StaticGrid(
                            gap: 12,
                            rowCrossAxisAlignment: CrossAxisAlignment.start,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            children: items
                                .map(
                                  (e) => MenuPosition(
                                    position: e,
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }

  SizedBox getBgCover() {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.network(
              'https://static1.squarespace.com/static/53b839afe4b07ea978436183/53bbeeb2e4b095b6a428a13e/5fd2570b51740e23cce97919/1678505081247/traditional-food-around-the-world-Travlinmad.jpg?format=1500w'),
        ),
      ),
    );
  }
}
