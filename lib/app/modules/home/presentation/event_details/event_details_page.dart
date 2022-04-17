import 'package:camp_final/app/modules/home/presentation/event_details/event_details_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../domain/entities/event_description_entity.dart';
import '../utils/extension/category_type_extension.dart';
import 'widgets/event_data_info_widget.dart';
import 'widgets/event_title_info_widget.dart';

class EventDetailsPage extends StatefulWidget {
  final EventDescriptionEntity event;

  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState
    extends ModularState<EventDetailsPage, EventDetailsStore> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Hero(
                tag: widget.event.id,
                child: Container(
                  height: height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.event.typeImage.coverPhoto),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back,
                  color: AppTheme.colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 280),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
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
                                  widget.event.name,
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
                                    widget.event.description,
                                    style: TextStyle(
                                        color: AppTheme.colors.black
                                            .withOpacity(0.5),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            Row(
                              children: [
                                const EventTitleInfoWidget(
                                  titleInfo: 'Organizador',
                                ),
                                const SizedBox(
                                  width: 22,
                                ),
                                Container(
                                  height: 32,
                                  width: 32,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.person),
                                ),
                                const SizedBox(
                                  width: 9,
                                ),
                                const EventDataInfoWidget(titleData: 'Ana Vaz')
                              ],
                            ),
                            const SizedBox(
                              height: 29,
                            ),
                            Row(
                              children: [
                                const EventTitleInfoWidget(
                                    titleInfo: 'Participantes:'),
                                const SizedBox(
                                  width: 15,
                                ),
                                EventDataInfoWidget(
                                  titleData: widget.event.numParticipants > 1
                                      ? '${widget.event.numParticipants} confirmados'
                                      : '${widget.event.numParticipants} confirmado',
                                )
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
                                    const EventTitleInfoWidget(
                                        titleInfo: 'Data:'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    EventDataInfoWidget(
                                        titleData: DateFormat(
                                                "EEE, d 'de' MMMM", "pt_BR")
                                            .format(DateTime.parse(
                                                widget.event.date))),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const EventTitleInfoWidget(
                                        titleInfo: 'Início:'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    EventDataInfoWidget(
                                        titleData:
                                            '${widget.event.startTime}h'),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
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
                              children: const [
                                EventTitleInfoWidget(titleInfo: 'Categories'),
                                Flexible(
                                    child: EventDataInfoWidget(
                                        titleData:
                                            'Yoga, presencial, gratis, etc'))
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
                                const SizedBox(
                                  width: 16,
                                ),
                                const EventDataInfoWidget(
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
                                const SizedBox(
                                  width: 15,
                                ),
                                const Flexible(
                                    child: EventDataInfoWidget(
                                        titleData:
                                            'Possui acessibilidade arquitetônica')),
                                const SizedBox(
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
                                    child: const Center(
                                      child: Text(
                                        '?',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
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
                                const EventDataInfoWidget(
                                    titleData: 'Evento Gratuito')
                              ],
                            ),
                            const SizedBox(
                              height: 31,
                            ),
                            Align(
                                child: Column(
                              children: const [
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: EventTitleInfoWidget(
                                        titleInfo: 'Local:')),
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
                            ),
                            const Align(
                                alignment: Alignment.bottomLeft,
                                child: EventTitleInfoWidget(
                                    titleInfo: 'Dúvidas? Pergunte ao fórum!')),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                const Flexible(
                                  child: EventDataInfoWidget(
                                      titleData:
                                          'Sua dúvida poderá ser respondida pelo organiza-dor ou participantes já confirmados.'),
                                ),
                                Container(
                                  width: 46,
                                  height: 46,
                                  decoration: BoxDecoration(
                                      color: AppTheme.colors.grey,
                                      shape: BoxShape.circle),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: const [
                                    Icon(Icons.abc),
                                    EventDataInfoWidget(titleData: 'Denunciar')
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Icon(Icons.abc),
                                    EventDataInfoWidget(
                                        titleData: 'Copiar link')
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: AppTheme.colors.primary,
                                    ),
                                    const EventDataInfoWidget(
                                        titleData: 'Compartilhar')
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 250,
                right: 30,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark,
                      size: 30,
                      color: AppTheme.colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
