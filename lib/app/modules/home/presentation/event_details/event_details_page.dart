import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:intl/intl.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../../../shared/presentation/utils/extension/string_extension_capitalize.dart';
import '../../../../shared/presentation/widgets/rounded_button_widget.dart';
import '../../domain/entities/event_description_entity.dart';
import '../utils/extension/category_type_extension.dart';
import 'event_details_state.dart';
import 'event_details_store.dart';
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
  void initState() {
    super.initState();
    getStatus();
  }

  void getStatus() {
    Future.wait([
      store.getFavorites(widget.event.id),
      store.getConfirmeds(widget.event.id)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: TripleBuilder<EventDetailsStore, Failure, EventDetailsState>(
            store: store,
            builder: (context, triple) {
              return Stack(
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
                                  height: widget.event.description.isNotEmpty
                                      ? 15
                                      : 0,
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
                                  height: widget.event.description.isNotEmpty
                                      ? 21
                                      : 0,
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
                                      titleData: widget.event.numParticipants >
                                              1
                                          ? '${widget.event.numParticipants} confirmados'
                                          : '${widget.event.numParticipants} confirmado',
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const EventTitleInfoWidget(
                                            titleInfo: 'Data:'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        EventDataInfoWidget(
                                            titleData: DateFormat(
                                                    "d 'de' MMMM", "pt_BR")
                                                .format(DateTime.parse(
                                                    widget.event.date))),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const EventTitleInfoWidget(
                                            titleInfo: 'Duração'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        EventDataInfoWidget(
                                            titleData:
                                                widget.event.endTime.isEmpty
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
                                            'Evento acessível a pessoas com deficiência?',
                                        boldFont: true,
                                      ),
                                    ),
                                  ],
                                ),
                                widget.event.eventAccessibilities.isEmpty
                                    ? const Padding(
                                        padding:
                                            EdgeInsets.only(left: 40, top: 5),
                                        child: Text(
                                          'Infelizmente, não! :/',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, top: 5),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Sim!',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            ...List.generate(
                                              widget.event.eventAccessibilities
                                                  .length,
                                              (index) {
                                                return Text(
                                                  "${widget.event.eventAccessibilities[index].accessibilities.name}${widget.event.eventAccessibilities.length == index + 1 ? '.' : ', '}",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.pets,
                                      color: AppTheme.colors.primary,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    const EventDataInfoWidget(
                                      titleData:
                                          'Evento aceita animais de estimação?',
                                      boldFont: true,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 40, top: 5),
                                  child: Text(
                                    widget.event.isPetFriendly
                                        ? "Sim! Aceita! :)"
                                        : 'Infelizmente, não! :/',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      widget.event.isOnline
                                          ? Icons.public
                                          : Icons.location_on,
                                      color: AppTheme.colors.primary,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    EventDataInfoWidget(
                                      titleData: widget.event.isOnline
                                          ? 'Link do Evento'
                                          : 'Local do evento',
                                      boldFont: true,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 40, top: 5),
                                  child: Text(
                                    widget.event.isOnline
                                        ? widget.event.url
                                        : "${widget.event.addresses.first.street}, ${widget.event.addresses.first.number}, ${widget.event.addresses.first.city} \n${widget.event.addresses.first.state}.",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                !widget.event.isOnline
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Image.asset(AppTheme.images.map),
                                      )
                                    : Container(),
                                const SizedBox(
                                  height: 26,
                                ),
                                const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: EventTitleInfoWidget(
                                        titleInfo:
                                            'Dúvidas? Pergunte ao fórum do evento!')),
                                const SizedBox(
                                  height: 7,
                                ),
                                const EventDataInfoWidget(
                                    titleData:
                                        'Sua dúvida poderá ser respondida pelo organiza-dor ou participantes já confirmados.'),
                                const SizedBox(
                                  height: 28,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    AppTheme.colors.greyLight,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: SvgPicture.asset(
                                                  AppTheme.icons.chat),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const EventDataInfoWidget(
                                              titleData: 'Fórum')
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    AppTheme.colors.greyLight,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: SvgPicture.asset(
                                                  AppTheme.icons.report),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const EventDataInfoWidget(
                                              titleData: 'Denunciar')
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    AppTheme.colors.greyLight,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.share,
                                                color: AppTheme.colors.primary,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const EventDataInfoWidget(
                                              titleData: 'Compartilhar')
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: RoundedButtonWidget(
                                    backgroundColor:
                                        triple.state.isConfirmed ?? false
                                            ? AppTheme.colors.green
                                            : AppTheme.colors.primary,
                                    width: MediaQuery.of(context).size.width,
                                    onPressed: triple.state.isConfirmed ?? false
                                        ? null
                                        : () async {
                                            await store
                                                .confirmed(widget.event.id);
                                          },
                                    textButton:
                                        triple.state.isConfirmed ?? false
                                            ? 'PRESENÇA CONFIRMADA'
                                            : 'QUERO PARTICIPAR',
                                    styleText: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 185,
                    right: 35,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppTheme.colors.greyLight,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () async {
                          await store.favorite(widget.event.id);
                        },
                        icon: SvgPicture.asset(triple.state.isFavorite ?? false
                            ? AppTheme.images.savedIcon
                            : AppTheme.images.nonSavedIcon),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
