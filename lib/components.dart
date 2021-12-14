import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'theme.dart';

class DayCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final String day;
  const DayCard({Key? key, required this.data, required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: MyColors.primaryPurple,
                    blurRadius: 200,
                    offset: Offset(10, 10),
                    spreadRadius: -8)
              ],
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                  image: AssetImage('assets/bg/cardBG.png'), fit: BoxFit.fill),
            ),
            child: Transform.translate(
              offset: const Offset(0, -24),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    SvgPicture.asset(
                      "assets/states/windy_night-02.svg",
                      height: 128,
                      color: MyColors.white2,
                    ),
                    Text(
                      " ${data['c'] ?? -1}\u00B0",
                      style: TxtThemes.bold72.copyWith(color: MyColors.white2),
                    ),
                    Text(
                      "Moon Cloud Fast Wind",
                      style: TxtThemes.black11.copyWith(color: MyColors.white2),
                    )
                  ],
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
                day,
                style: TxtThemes.bold11.copyWith(color: MyColors.primaryGray),
              ),
            ),
          )
        ]);
  }
}

class MetricsCard extends StatelessWidget {
  final Map metrics;
  const MetricsCard({Key? key, required this.metrics}) : super(key: key);

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
                "${metrics['humidity'] ?? -1}%",
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
                "${metrics['wind'] ?? -1} km/h",
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
                "${metrics['press'] ?? -1}",
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
                "${metrics['vis'] ?? -1} km",
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
  final bool primary;
  const TimeCard({Key? key, this.primary = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          color: primary ? null : MyColors.white,
          image: primary
              ? const DecorationImage(
                  image: AssetImage('assets/bg/cardBG.png'), fit: BoxFit.fill)
              : null,
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "06:00 AM",
            style: TxtThemes.semiB12.copyWith(
                color: primary ? MyColors.white2 : MyColors.primaryGray),
          ),
          SvgPicture.asset(
            'assets/states/windy_night-02.svg',
            color: primary ? MyColors.white2 : MyColors.secondaryPurple,
            height: 64,
          ),
          Text(
            "24\u00B0C",
            style: TxtThemes.black18.copyWith(
                color: primary ? MyColors.white2 : MyColors.primaryGray),
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
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: MyColors.white.withOpacity(0.65)),
          color: MyColors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            'assets/states/windy_night-02.svg',
            height: 128,
            color: MyColors.white2,
          ),
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
                offset: const Offset(0, -50),
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
                          SvgPicture.asset(
                            'assets/states/windy_night-02.svg',
                            height: 80,
                            color: MyColors.secondaryPurple,
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
