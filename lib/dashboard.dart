import 'package:flutter/material.dart';
import 'theme.dart';
import 'components.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 24),
        color: MyColors.fifo,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Dhaka",
              style: TxtThemes.extraB24.copyWith(color: MyColors.primaryGray),
            ),
            Text(
              "17:45 PM",
              style: TxtThemes.semiB12.copyWith(color: MyColors.primaryGray),
            ),
            const SizedBox(
              height: 24,
            ),
            const DayCard(),
            const SizedBox(
              height: 16,
            ),
            const MetricsCard()
          ],
        ),
      ),
    );
  }
}
