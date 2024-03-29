import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../domain/entities/event_description_entity.dart';
import '../utils/extension/category_type_extension.dart';
import 'circle_avatar_widget.dart';
import 'custom_chip_label_widget.dart';

class EventItemCardTile extends StatelessWidget {
  final EventDescriptionEntity event;
  final bool favorite;
  const EventItemCardTile(
      {Key? key, required this.event, required this.favorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 4,
              child: Hero(
                tag: event.id,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        event.typeImage.coverPhoto,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              event.formattedDate,
                              style: TextStyle(
                                color: AppTheme.colors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.colors.greyLight,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        event.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppTheme.colors.primary,
                            size: 19,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Flexible(
                            child: Text(
                              !event.isOnline
                                  ? event.addresses.first.street
                                  : 'Online',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppTheme.colors.black.withOpacity(0.5),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    !event.isOnline
                        ? Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: Text(
                              event.addresses.first.city,
                              style: TextStyle(
                                color: AppTheme.colors.black.withOpacity(0.5),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : Container(),
                    event.numParticipants > 0
                        ? Padding(
                            padding: const EdgeInsets.only(left: 0, top: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: event.numParticipants <= 1 ? 30 : 60,
                                  child: Stack(
                                    children: [
                                      event.numParticipants >= 1
                                          ? Positioned(
                                              left: 10,
                                              child: CircleAvatarWidget(
                                                image: AppTheme.images.person1,
                                              ),
                                            )
                                          : Container(),
                                      event.numParticipants >= 2
                                          ? Positioned(
                                              right: 10,
                                              child: CircleAvatarWidget(
                                                image: AppTheme.images.person2,
                                              ),
                                            )
                                          : Container(),
                                      event.numParticipants >= 3
                                          ? Positioned(
                                              right: -5,
                                              child: CircleAvatarWidget(
                                                image: AppTheme.images.person3,
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: event.numParticipants < 1 ? 0 : 6,
                                ),
                                Text(
                                  event.numParticipants > 1
                                      ? '${event.numParticipants} confirmados'
                                      : '${event.numParticipants} confirmado',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.colors.black
                                          .withOpacity(0.5)),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 28, top: 5, bottom: 5),
                            child: Text(
                              'Sem confirmados',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      AppTheme.colors.black.withOpacity(0.5)),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          CustomChipLabelWidget(label: event.activities.name),
                          event.price.toInt() == 0
                              ? const CustomChipLabelWidget(
                                  label: 'Grátis',
                                )
                              : Container(),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(favorite
                                  ? AppTheme.images.savedIcon
                                  : AppTheme.images.nonSavedIcon),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
