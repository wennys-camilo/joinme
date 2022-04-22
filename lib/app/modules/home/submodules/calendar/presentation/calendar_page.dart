import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colors.primary,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  AppTheme.icons.calendar,
                  color: AppTheme.colors.primary,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
              Text(
                'Em breve',
                style: TextStyle(
                  color: AppTheme.colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
