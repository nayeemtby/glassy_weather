import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'api/locals.dart';
import 'api/cache/current.dart';
import 'api/api.dart';
import 'theme.dart';
import 'components.dart';
import 'details.dart';
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mqData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: mqData.size.width < 600 ? 16 : 24),
        color: MyColors.fifo,
        width: double.infinity,
        child: FutureBuilder(
            future: getCurrent('Dhaka'),
            initialData: cache,
            builder: (ctx, snap) {
              if (snap.hasError) {
                print(snap.error);
              }
              Map<String, dynamic> current = snap.data as Map<String, dynamic>;
              current = current['current'];
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Dhaka",
                        style: TxtThemes.extraB24
                            .copyWith(color: MyColors.primaryGray),
                      ),
                      Text(
                        getFormattedTime(DateTime.now()),
                        style: TxtThemes.semiB12
                            .copyWith(color: MyColors.primaryGray),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      _CarouselSlider(
                        mqData: mqData,
                        current: current,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  _BottomUnit(
                    current: current,
                    mqData: mqData,
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class _CarouselSlider extends StatelessWidget {
  final MediaQueryData mqData;
  final Map current;
  const _CarouselSlider({
    Key? key,
    required this.mqData,
    required this.current,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardWidth;
    final double cardHeight;
    final Size temperatureSize;
    final double secondaryTextHeight;
    final double cloudSize;
    final double vpad;
    final double hpad;
    final double tpad;
    final TextStyle temperatureStyle;
    final TextStyle chipTxtStyle;
    final TextStyle statusStyle;
    if (mqData.size.width < 600) {
      temperatureSize = getTxtSize(
        txt: '99999',
        factor: mqData.textScaleFactor,
        style: TxtThemesXs.bold72,
      );
      secondaryTextHeight = TxtThemesXs.black11.fontSize!;
      hpad = 18;
      vpad = 14;
      cloudSize = 80;
      tpad = 20;
      temperatureStyle = TxtThemesXs.bold72;
      statusStyle = TxtThemesXs.black11;
      chipTxtStyle = TxtThemesXs.bold11;
    } else if (mqData.size.width < 1440) {
      temperatureSize = getTxtSize(
        txt: '99999',
        factor: mqData.textScaleFactor,
        style: TxtThemes.bold72,
      );
      secondaryTextHeight = TxtThemes.black11.fontSize!;
      hpad = 20;
      vpad = 16;
      cloudSize = 128;
      tpad = 20;
      temperatureStyle = TxtThemes.bold72;
      statusStyle = TxtThemes.black11;
      chipTxtStyle = TxtThemes.bold11;
    } else {
      temperatureSize = getTxtSize(
        txt: '99999',
        factor: mqData.textScaleFactor,
        style: TxtThemesXl.bold72,
      );
      secondaryTextHeight = TxtThemesXl.black11.fontSize!;
      hpad = 30;
      vpad = 28;
      cloudSize = 256;
      tpad = 36;
      temperatureStyle = TxtThemesXl.bold72;
      statusStyle = TxtThemesXl.black11;
      chipTxtStyle = TxtThemesXl.bold11;
    }
    cardHeight = tpad +
        (2 * vpad) +
        cloudSize +
        temperatureSize.height +
        secondaryTextHeight +
        5; // 5 Pixels safety
    cardWidth = (hpad * 2) + temperatureSize.width;
    return SizedBox(
      height: cardHeight,
      width: double.infinity,
      child: ScrollSnapList(
        scrollPhysics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        itemBuilder: (ctx, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: cardWidth * 0.2),
          child: DayCardXs(
            day: getFormattedDay(DateTime.now()),
            data: {'c': current['temp_c']},
            hpad: hpad,
            vpad: vpad,
            imageSize: cloudSize,
            tpad: tpad,
            temperatureStyle: temperatureStyle,
            chipTxtStyle: chipTxtStyle,
            statusStyle: statusStyle,
            width: cardWidth,
          ),
        ),
        itemCount: 7,
        itemSize: cardWidth * 1.4,
        onItemFocus: (_) {},
      ),
    );
  }
}

class _BottomUnit extends StatelessWidget {
  final Map current;
  final MediaQueryData mqData;
  const _BottomUnit({
    Key? key,
    required this.current,
    required this.mqData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double iconHeight;
    final double gutter;
    final double pad;
    final TextStyle dataStyle;
    final TextStyle titleStyle;
    final double metricsHeight;
    final TextStyle navStyle;
    if (mqData.size.width < 600) {
      gutter = 8;
      iconHeight = 16;
      pad = 24;
      dataStyle = TxtThemesXs.black16;
      titleStyle = TxtThemesXs.black11;
      navStyle = TxtThemesXs.black16;
    } else if (mqData.size.width < 1440) {
      gutter = 16;
      iconHeight = 24;
      pad = 32;
      dataStyle = TxtThemes.black16;
      titleStyle = TxtThemes.black11;
      navStyle = TxtThemes.black16;
    } else {
      gutter = 24;
      iconHeight = 36;
      pad = 38;
      dataStyle = TxtThemesXl.black16;
      titleStyle = TxtThemesXl.black11;
      navStyle = TxtThemesXl.black16;
    }
    metricsHeight =
        iconHeight + (pad * 2) + dataStyle.fontSize! + titleStyle.fontSize!;
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 24),
      alignment: Alignment.topCenter,
      width: double.infinity,
      color: MyColors.purple1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.translate(
              offset: Offset(0, -metricsHeight * 0.7),
              child: MetricsCard(
                dataStyle: dataStyle,
                titleStyle: titleStyle,
                pad: pad,
                iconHeight: iconHeight,
                gutter: gutter,
                metrics: {
                  'humidity': current['humidity'],
                  'wind': current['wind_kph'],
                  'press': current['pressure_mb'],
                  'vis': current['vis_km']
                },
              )),
          Transform.translate(
            offset: Offset(0, -pad),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: navStyle.copyWith(color: MyColors.primaryGray),
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
                        style: navStyle.copyWith(color: MyColors.primaryGray),
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
          _HourForecast(
            width: mqData.size.width,
          )
        ],
      ),
    );
  }
}

class _HourForecast extends StatelessWidget {
  final double width;
  const _HourForecast({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double iconHeight;
    final TextStyle timeStyle;
    final TextStyle tempStyle;
    if (width < 600) {
      iconHeight = 48;
      timeStyle = TxtThemesXs.semiB12;
      tempStyle = TxtThemesXs.black18;
    } else if (width < 1440) {
      iconHeight = 64;
      timeStyle = TxtThemes.semiB12;
      tempStyle = TxtThemes.black18;
    } else {
      iconHeight = 96;
      timeStyle = TxtThemesXl.semiB12;
      tempStyle = TxtThemesXl.black18;
    }
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 7; i++)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: TimeCard(
                iconHeight: iconHeight,
                tempStyle: tempStyle,
                timeStyle: timeStyle,
                primary: i == 0 ? true : false,
              ),
            )
        ],
      ),
    );
  }
}
