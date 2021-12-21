import 'package:flutter/material.dart';
import 'package:glassy_weather/api/locals.dart';
import 'theme.dart';
import 'components.dart';

class DetailsScreen extends StatelessWidget {
  final List forecast;
  const DetailsScreen({
    Key? key,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mqData = MediaQuery.of(context);
    final TextStyle titleStyle;
    final TextStyle dayStyle;
    if (mqData.size.width < 600) {
      titleStyle = TxtThemesXs.extraB24;
      dayStyle = TxtThemesXs.bold11;
    } else if (mqData.size.width < 1440) {
      titleStyle = TxtThemes.extraB24;
      dayStyle = TxtThemes.bold11;
    } else {
      titleStyle = TxtThemesXl.extraB24;
      dayStyle = TxtThemesXl.bold11;
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: MyColors.white2,
                        size: mqData.size.width < 1440 ? 24 : 36,
                      )),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Today's Weather",
                        style: titleStyle.copyWith(color: MyColors.white2),
                      ),
                      Text(
                        getFormattedDay(DateTime.now()),
                        style: dayStyle.copyWith(color: MyColors.white2),
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
              TransparentCard(
                status: forecast[0]['day']['condition']['text'],
                temperature: forecast[0]['day']['avgtemp_c'].toString(),
                width: mqData.size.width,
              ),
              const SizedBox(
                height: 42,
              ),
              Expanded(
                  child: WeatherListCard(
                width: mqData.size.width,
                forecast: forecast,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
