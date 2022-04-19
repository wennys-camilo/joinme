import 'package:flutter/material.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../domain/entities/event_description_entity.dart';
import '../utils/extension/category_type_extension.dart';
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
        elevation: 0,
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 8),
                      child: Text(
                        event.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.colors.black,
                        ),
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
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              event.addresses.first.city,
                              style: TextStyle(
                                color: AppTheme.colors.black.withOpacity(0.5),
                              ),
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 48,
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        border: Border.all(
                                            color: AppTheme.colors.grey),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Positioned(
                                  child: Center(
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          border: Border.all(
                                              color: AppTheme.colors.grey),
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(
                                            color: AppTheme.colors.grey),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            event.numParticipants > 1
                                ? '${event.numParticipants} confirmados'
                                : '${event.numParticipants} confirmado',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.colors.black.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          CustomChipLabelWidget(label: event.activities.name),
                          event.price.toInt() == 0
                              ? CustomChipLabelWidget(
                                  label: 'Grátis',
                                  color: AppTheme.colors.green,
                                )
                              : Container(),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  favorite
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline,
                                  color: AppTheme.colors.primary,
                                  size: 30,
                                )),
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
