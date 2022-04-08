import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.red[300],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 44, left: 44),
              child: Row(children: [
                Icon(
                  Icons.keyboard_backspace,
                  color: AppTheme.colors.primary,
                  size: 30,
                )
              ]),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Perfil',
                    style: TextStyle(fontSize: 23),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.black,
                  )
                ],
              ),
            ), SizedBox(height: 42,),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 118,
                    width: 118,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppTheme.colors.grey),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.colors.primary)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
