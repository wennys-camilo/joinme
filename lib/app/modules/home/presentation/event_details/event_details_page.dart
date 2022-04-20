import 'package:brasil_fields/brasil_fields.dart';
import 'package:camp_final/app/modules/home/presentation/event_details/event_details_state.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import 'event_details_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../domain/entities/event_description_entity.dart';
import '../utils/extension/category_type_extension.dart';
import 'widgets/event_data_info_widget.dart';
import 'widgets/event_title_info_widget.dart';
import 'package:camp_final/app/shared/presentation/utils/extension/string_extension_capitalize.dart';

class EventDetailsPage extends StatefulWidget {
  final EventDescriptionEntity event;

  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState
    extends ModularState<EventDetailsPage, EventDetailsStore> {
  @override
  void initState() {
    super.initState();
    store.getFavorites(widget.event.id);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: <Widget>[
              Hero(
                tag: widget.event.id,
                child: Container(
                  height: height * 0.35,
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
                padding: const EdgeInsets.only(top: 200),
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
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35)),
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.event.name,
                                  style: TextStyle(
                                    color: AppTheme.colors.logoBlue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  widget.event.description.isNotEmpty ? 15 : 0,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.event.description,
                                    style: TextStyle(
                                        color: AppTheme.colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height:
                                  widget.event.description.isNotEmpty ? 21 : 0,
                            ),
                            Row(
                              children: [
                                const EventTitleInfoWidget(
                                  titleInfo: 'Organizador:',
                                ),
                                const SizedBox(
                                  width: 10,
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
                                EventDataInfoWidget(
                                    titleData: widget.event.eventCreatorName
                                        .toTitleCase())
                              ],
                            ),
                            const SizedBox(
                              height: 10,
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
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const EventTitleInfoWidget(
                                        titleInfo: 'Categoria:'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    EventDataInfoWidget(
                                        titleData:
                                            widget.event.activities.name),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const EventTitleInfoWidget(
                                        titleInfo: 'Modalidade:'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    EventDataInfoWidget(
                                      titleData: widget.event.isOnline
                                          ? 'Online'
                                          : 'Presencial',
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: AppTheme.colors.primary,
                                      width: 1.2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.event.price.toInt() == 0
                                          ? 'Gratuito'
                                          : UtilBrasilFields.obterReal(
                                              widget.event.price),
                                      style: TextStyle(
                                        color: AppTheme.colors.primary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
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
                                        titleData:
                                            DateFormat("d 'de' MMMM", "pt_BR")
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
                                  children: [
                                    const EventTitleInfoWidget(
                                        titleInfo: 'Duração'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    EventDataInfoWidget(
                                        titleData: widget.event.endTime.isEmpty
                                            ? '-'
                                            : widget.event.endTime),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.accessible,
                                  color: AppTheme.colors.primary,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Flexible(
                                  child: EventDataInfoWidget(
                                      titleData:
                                          'Evento acessível a pessoas com deficiência?'),
                                ),
                              ],
                            ),
                            widget.event.eventAccessibilities.isEmpty
                                ? const Text(
                                    'Infelizmente, não! :/',
                                    textAlign: TextAlign.start,
                                  )
                                : Row(
                                    children: [
                                      Text(
                                        'Sim!',
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
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
              TripleBuilder<EventDetailsStore, Failure, EventDetailsState>(
                  store: store,
                  builder: (context, triple) {
                    return Positioned(
                      top: 185,
                      right: 35,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppTheme.colors.greyBoard,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            await store.favorite(widget.event.id);
                          },
                          icon: Icon(
                            triple.state.isFavorite ?? false
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            size: 30,
                            color: AppTheme.colors.primary,
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
