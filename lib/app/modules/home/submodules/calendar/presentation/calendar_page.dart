import 'package:camp_final/app/shared/presentation/widgets/rounded_button_widget.dart';

import '../../../../../shared/presentation/themes/app_theme.dart';
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
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                SvgPicture.asset(
                  AppTheme.icons.calendar,
                  color: AppTheme.colors.primary,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                Text(
                  'Em breve',
                  style: TextStyle(
                    color: AppTheme.colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const Expanded(
                    child: SizedBox(
                  height: 5,
                )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
                  child: RoundedButtonWidget(
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Em breve!'),
                        duration: Duration(seconds: 1),
                      ));
                    },
                    backgroundColor: AppTheme.colors.blueLight,
                    googleButton: true,
                    textButton: 'SINCRONIZAR COM O GOOGLE AGENDA',
                    styleText: TextStyle(
                      color: AppTheme.colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
