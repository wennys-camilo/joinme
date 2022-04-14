import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../home_page.dart';

class EventHorizontalGridView extends StatefulWidget {
  final String events;
  const EventHorizontalGridView({
    Key? key,
    required this.events,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  State<EventHorizontalGridView> createState() => _EventHorizontalGridViewState();
}

class _EventHorizontalGridViewState extends State<EventHorizontalGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 160 / 328, crossAxisCount: 1, mainAxisSpacing: 4),
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (() {
            Modular.to.pushNamed('./eventPage');
          }),
          child: Card(
            clipBehavior: Clip.antiAlias,
            color: AppTheme.colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  height: 160,
                  width: 120,
                  color: Colors.red,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              '28 abril',
                              style: TextStyle(
                                  color: AppTheme.colors.primary,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Text(
                          widget.events,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          Flexible(
                              child: Text(
                            'Gramado do Centro de Vivência, Campus II, UFMG',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.colors.black.withOpacity(0.5)),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Container(
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
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '8 confirmados',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.colors.black.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 43,
                            width: 150,
                            child: ListView.builder(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: FilterChip(
                                      backgroundColor: AppTheme.colors.grey,
                                      side: BorderSide(
                                          color: Colors.black.withOpacity(0.3)),
                                      label: Text(
                                        'acessivel',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: AppTheme.colors.black
                                                .withOpacity(0.5)),
                                      ),
                                      onSelected: (b) {},
                                    ),
                                  );
                                }),
                          ),
                          GestureDetector(
                              onTap: () {}, child: Icon(Icons.flag)),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
