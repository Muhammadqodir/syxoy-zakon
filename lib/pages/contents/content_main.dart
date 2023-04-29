import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/models/menu_item.dart';
import 'package:suxoy_zakon/pages/search_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/action_btn.dart';
import 'package:suxoy_zakon/widgets/cart.dart';
import 'package:suxoy_zakon/widgets/custom_btn.dart';
import 'package:suxoy_zakon/widgets/custom_tabs.dart';
import 'package:suxoy_zakon/widgets/menu_position.dart';
import 'package:suxoy_zakon/widgets/static_grid.dart';

class ContentMain extends StatefulWidget {
  const ContentMain({super.key, required this.isLogin});
  final bool isLogin;

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
  Api api = Api();
  ScrollController _controller = ScrollController();

  _fillData() async {
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

  _getCategory(int index) async {
    _controller.animateTo(0,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
    String category = categoriesList[index];
    Response<List<MenuItem>> menuRes = await api.getMenuByCategory(category);
    if (menuRes.success) {
      items = menuRes.data!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            // _fillData();
          },
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  Stack(
                    children: [
                      getBgCover(),
                      SafeArea(
                        top: true,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: Column(
                                children: [
                                  const SizedBox(height: 12,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      widget.isLogin
                                          ? CartWidget()
                                          : SizedBox(),
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => SearchPage(),
                                        ),
                                      );
                                    },
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
                            StickyHeader(
                              header: Container(
                                color: const Color(0xFFF9F9F9),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 12,),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).padding.top,
                                    ),
                                    CustomTabs(
                                      tabs: categoriesList,
                                      onChanged: _getCategory,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ),
                              content: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  StaticGrid(
                                    gap: 12,
                                    rowCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    children: items
                                        .map(
                                          (e) => MenuPosition(
                                            position: e,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
            'https://abduvoitov.uz/suxoy_zakon/assets/header.jpeg',
          ),
        ),
      ),
    );
  }
}
