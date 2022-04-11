import 'package:flutter/material.dart';

import '../../domain/entities/interests_entity.dart';

class InterestWidget extends StatefulWidget {
  final bool selected;
  final InterestsEntity interests;

  const InterestWidget(
      {Key? key, required this.selected, required this.interests})
      : super(key: key);

  @override
  State<InterestWidget> createState() => _InterestWidgetState();
}

class _InterestWidgetState extends State<InterestWidget> {
  late final NetworkImage _imageActivate;
  late final NetworkImage _imageInactivate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _imageActivate = NetworkImage(widget.interests.urlActive);
    _imageInactivate = NetworkImage(widget.interests.urlInactive);
    precacheImage(_imageActivate, context);
    precacheImage(_imageInactivate, context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: widget.selected ? _imageActivate : _imageInactivate,
                )),
          ),
        ),
        Text(widget.interests.name)
      ],
    );
  }
}
