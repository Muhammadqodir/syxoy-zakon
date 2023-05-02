import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/models/menu_item.dart';
import 'package:suxoy_zakon/widgets/menu_position.dart';
import 'package:suxoy_zakon/widgets/static_grid.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<MenuItem>? models;
  Api api = Api();
  @override
  void initState() {
    super.initState();
  }

  Timer? _debounce;
  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      if (value.length >= 2) {
        api.search(value).then((value) {
          if (value.success) {
            setState(() {
              models = value.data!;
            });
          }
        });
      } else {
        setState(() {
          models = null;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _debounce?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          child: const Icon(CupertinoIcons.arrow_left),
        ),
        titleSpacing: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.5,
        title: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CupertinoSearchTextField(
            autofocus: true,
            placeholder: "Поиск",
            style: Theme.of(context).textTheme.bodyMedium,
            onChanged: _onSearchChanged,
          ),
        ),
      ),
      body: Center(
        child: models != null
            ? models!.isNotEmpty
                ? Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      StaticGrid(
                        gap: 12,
                        rowCrossAxisAlignment: CrossAxisAlignment.start,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        children: models!
                            .map(
                              (e) => MenuPosition(
                                position: e,
                                api: api,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      "Поиск не дал результатов",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Theme.of(context).primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Поиск",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
      ),
    );
  }
}
