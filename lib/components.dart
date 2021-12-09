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
      decoration: BoxDecoration(
          color: MyColors.white, borderRadius: BorderRadius.circular(20)),
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
