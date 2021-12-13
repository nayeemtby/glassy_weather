import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'theme.dart';

class DayCard extends StatelessWidget {
  const DayCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Material(
              color: MyColors.secondaryPurple,
              child: Transform.translate(
                offset: const Offset(0, -24),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("assets/states/tmp.png"),
                      Text(
                        " 23\u00B0",
                        style:
                            TxtThemes.bold72.copyWith(color: MyColors.white2),
                      ),
                      Text(
                        "Moon Cloud Fast Wind",
                        style:
                            TxtThemes.black11.copyWith(color: MyColors.white2),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(40)),
              padding: const EdgeInsets.all(8),
              child: Text(
                "Sunday, 8th March 2021",
                style: TxtThemes.bold11.copyWith(color: MyColors.primaryGray),
              ),
            ),
          )
        ]);
  }
}

class MetricsCard extends StatelessWidget {
  const MetricsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: MyColors.secondaryPurple,
            blurRadius: 30,
            spreadRadius: -20,
            offset: Offset(0, 30))
      ], color: MyColors.white, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/metrics/carbon_humidity.svg"),
              Text(
                "75%",
                style: TxtThemes.black16.copyWith(color: MyColors.primaryGray),
              ),
              Text("Humidity",
                  style: TxtThemes.black11.copyWith(
                    color: MyColors.secondaryPurple,
                  ))
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/metrics/tabler_wind.svg"),
              Text(
                "8 km/h",
                style: TxtThemes.black16.copyWith(color: MyColors.primaryGray),
              ),
              Text("Wind",
                  style: TxtThemes.black11.copyWith(
                    color: MyColors.secondaryPurple,
                  ))
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/metrics/ion_speedometer.svg"),
              Text(
                "1011",
                style: TxtThemes.black16.copyWith(color: MyColors.primaryGray),
              ),
              Text("Air Pressure",
                  style: TxtThemes.black11.copyWith(
                    color: MyColors.secondaryPurple,
                  ))
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/metrics/ic_round-visibility.svg"),
              Text(
                "6 km",
                style: TxtThemes.black16.copyWith(color: MyColors.primaryGray),
              ),
              Text("Visibility",
                  style: TxtThemes.black11.copyWith(
                    color: MyColors.secondaryPurple,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: MyColors.secondaryPurple,
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "06:00 AM",
            style: TxtThemes.semiB12.copyWith(color: MyColors.white2),
          ),
          Image.asset(
            'assets/states/tmp.png',
            scale: 2,
          ),
          Text(
            "24\u00B0C",
            style: TxtThemes.black18.copyWith(color: MyColors.white2),
          )
        ],
      ),
    );
  }
}

class TransparentCard extends StatelessWidget {
  const TransparentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: MyColors.white.withOpacity(0.65)),
          color: MyColors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/states/tmp.png'),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '23\u00B0',
                style: TxtThemes.bold72.copyWith(color: MyColors.white2),
              ),
              Text(
                'Moon Cloud Fast Wind',
                style: TxtThemes.black11.copyWith(color: MyColors.white2),
              )
            ],
          )
        ],
      ),
    );
  }
}

class WeatherListCard extends StatelessWidget {
  const WeatherListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: MyColors.white.withOpacity(0.3),
                offset: Offset(0, -50),
                spreadRadius: -25)
          ],
          color: MyColors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            Text(
              "Future Weather",
              style: TxtThemes.black18.copyWith(color: MyColors.primaryGray),
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (ctx, index) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/states/tmp.png',
                            scale: 2,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Text(
                            "23\u00B0",
                            style: TxtThemes.black36
                                .copyWith(color: MyColors.primaryGray),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Monday",
                                style: TxtThemes.extraB13
                                    .copyWith(color: MyColors.primaryGray),
                              ),
                              Text(
                                "9th March 2021",
                                style: TxtThemes.extraB13
                                    .copyWith(color: MyColors.secondaryPurple),
                              )
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (ctx, index) => const Divider(
                          thickness: 1,
                          color: MyColors.secondaryGray,
                        ),
                    itemCount: 9))
          ],
        ));
  }
}
