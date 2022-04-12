import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: AppTheme.colors.primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Colors.red[400],
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    'Yoga ao ar livre',
                    style: TextStyle(
                        color: AppTheme.colors.primary,
                        fontSize: 23,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                    'Prática de yoga gratuita no gramado do Campus, para inciantes.',
                    style: TextStyle(
                        color: AppTheme.colors.black.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ))
                ],
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                children: [
                  Text(
                    'Organizador',
                    style: TextStyle(
                        color: AppTheme.colors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    color: Colors.black,
                  ),
                  Text(
                    'Ana Vaz',
                    style: TextStyle(
                        color: AppTheme.colors.black.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    ));
  }
}
