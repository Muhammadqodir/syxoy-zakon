import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suxoy_zakon/api_master.dart';
import 'package:suxoy_zakon/pages/profile_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'package:suxoy_zakon/widgets/on_tap_scale.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.phone, required this.userName});

  final String phone;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      onTap: () async {
        String token =
            (await SharedPreferences.getInstance()).getString("token") ??
                "undefined";
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ProfilePage(
              api: Api(
                token: token,
              ),
            ),
          ),
        );
      },
      lowerBound: 0.9,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                CupertinoIcons.person,
                color: primaryColor,
                size: 38,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    phone,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                  // Text(
                  //   userName,
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .titleSmall!
                  //       .copyWith(color: Colors.white),
                  // ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.pen,
              color: Colors.white,
              size: 26,
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
