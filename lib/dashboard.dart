import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'theme.dart';
import 'components.dart';
import 'details.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Dhaka",
                  style:
                      TxtThemes.extraB24.copyWith(color: MyColors.primaryGray),
                ),
                Text(
                  "17:45 PM",
                  style:
                      TxtThemes.semiB12.copyWith(color: MyColors.primaryGray),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ScrollSnapList(
                      clipBehavior: Clip.none,
                      itemBuilder: (ctx, index) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 48),
                            child: DayCard(),
                          ),
                      itemCount: 7,
                      itemSize: 128 + (48 * 2) + (48 * 2),
                      onItemFocus: (_) {}),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 24),
              alignment: Alignment.topCenter,
              width: double.infinity,
              color: MyColors.purple1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                      offset: const Offset(0, -80), child: const MetricsCard()),
                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today',
                          style: TxtThemes.black16
                              .copyWith(color: MyColors.primaryGray),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => const DetailsScreen()));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Next 7 Days',
                                style: TxtThemes.black16
                                    .copyWith(color: MyColors.primaryGray),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: MyColors.primaryGray,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var i = 0; i < 7; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: const TimeCard(),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
