import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'widgets/container_light_primary_widget.dart';
import 'widgets/subtitle_text_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: AppTheme.colors.primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
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
              const SizedBox(
                height: 42,
              ),
              GestureDetector( onDoubleTap: () {
              },
                child: Center(
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
                            child: Icon(
                              Icons.create_rounded,
                              color: AppTheme.colors.white,
                            ),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.colors.primary)),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 37),
                child: Text(
                  'Olá Luma Silva',
                  style: TextStyle(
                      color: AppTheme.colors.black.withOpacity(0.5),
                      fontSize: 23,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerLightPrimary(
                    superiorIcon: Text(
                      '2',
                      style: TextStyle(
                          color: AppTheme.colors.primary,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                    inferior: 'Eventos',
                  ),
                  ContainerLightPrimary(
                    superiorIcon: Icon(Icons.badge),
                    inferior: 'Nível #',
                  ),
                  ContainerLightPrimary(
                    superiorIcon: Text(
                      '140',
                      style: TextStyle(
                          color: AppTheme.colors.primary,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                    inferior: 'Minutos',
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  SubtitleText(
                    subtitle: 'Sobre mim',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.create_rounded,
                      color: AppTheme.colors.black.withOpacity(0.6)),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipis-cing elit ut aliquam, purus sit amet luctus vene-natis, lectus magna fringilla.', style: TextStyle(color: AppTheme.colors.black.withOpacity(0.6),fontSize: 16, fontWeight: FontWeight.w400),),
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  SubtitleText(subtitle: 'Interesses'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.create_rounded,
                      color: AppTheme.colors.black.withOpacity(0.6)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
