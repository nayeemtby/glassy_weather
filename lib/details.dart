import 'package:flutter/material.dart';
import 'theme.dart';
import 'components.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 16),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg/detailsBG.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: MyColors.white2,
                    )),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Today's Weather",
                      style:
                          TxtThemes.extraB24.copyWith(color: MyColors.white2),
                    ),
                    Text(
                      'Sunday, 8th March 2021',
                      style: TxtThemes.bold11.copyWith(color: MyColors.white2),
                    )
                  ],
                ),
                const SizedBox(
                  width: 24,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const TransparentCard(),
            const SizedBox(
              height: 42,
            ),
            const Expanded(child: WeatherListCard())
          ],
        ),
      ),
    );
  }
}
