import 'package:camp_final/app/modules/home/submodules/event_page/presentation/widget/event_data_info_widget.dart';
import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'widget/event_title_info_widget.dart';

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
                  EventTitleInfoWidget(
                    titleInfo: 'Organizador',
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  EventDataInfoWidget(titleData: 'Ana Vaz')
                ],
              ),
              SizedBox(
                height: 29,
              ),
              Row(
                children: [
                  EventTitleInfoWidget(titleInfo: 'Participantes:'),
                  const SizedBox(
                    width: 15,
                  ),
                  EventDataInfoWidget(titleData: '6 confirmados')
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EventTitleInfoWidget(titleInfo: 'Data:'),
                      const SizedBox(
                        height: 10,
                      ),
                      EventDataInfoWidget(titleData: 'Sáb, 30 de abril'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EventTitleInfoWidget(titleInfo: 'Início:'),
                      const SizedBox(
                        height: 10,
                      ),
                      EventDataInfoWidget(titleData: '8:30h'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EventTitleInfoWidget(titleInfo: 'Término'),
                      SizedBox(
                        height: 10,
                      ),
                      EventDataInfoWidget(titleData: '9:30h'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  EventTitleInfoWidget(titleInfo: 'Categories'),
                  Flexible(
                      child: EventDataInfoWidget(
                          titleData: 'Yoga, presencial, gratis, etc'))
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppTheme.colors.primary,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  EventDataInfoWidget(
                    titleData: 'Evento Presencial',
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.wheelchair_pickup,
                    color: AppTheme.colors.primary,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                      child: EventDataInfoWidget(
                          titleData: 'Possui acessibilidade arquitetônica')),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: AppTheme.colors.primary,
                            shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                          '?',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ))),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.people,
                    color: AppTheme.colors.primary,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  EventDataInfoWidget(titleData: 'Evento Gratuito')
                ],
              ),
              const SizedBox(
                height: 31,
              ),
              Align(
                  child: Column(
                children: [
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: EventTitleInfoWidget(titleInfo: 'Local:')),
                  SizedBox(
                    height: 10,
                  ),
                  EventDataInfoWidget(
                      titleData:
                          'Gramado do Centro de Vivência, Campus I da Universidade, Belo Horizonte, MG')
                ],
              )),
              const SizedBox(
                height: 26,
              ),
              Container(
                width: double.infinity,
                height: 182,
                color: Colors.white,
              ),
              const SizedBox(
                height: 26,
              )
            ],
          ),
        ),
      )),
    ));
  }
}
