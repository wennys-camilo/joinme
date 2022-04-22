import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import "../utils/extension/mood_icon_type_extension.dart";
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../home/home_state.dart';
import '../home/home_store.dart';

class MoodDialogWidget extends StatefulWidget {
  final bool barrierDismissible;

  const MoodDialogWidget({
    Key? key,
    this.barrierDismissible = true,
  }) : super(key: key);

  @override
  State<MoodDialogWidget> createState() => _MoodDialogWidgetState();
}

class _MoodDialogWidgetState extends ModularState<MoodDialogWidget, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return TripleBuilder<HomeStore, Failure, HomeState>(
        builder: (context, triple) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        backgroundColor: const Color(0XFFE9E5FF),
        content: SingleChildScrollView(
            child: Stack(
          children: [
            Positioned(
              right: -10,
              top: -15,
              child: IconButton(
                onPressed: () {
                  Modular.to.pop();
                },
                icon: Icon(
                  Icons.close,
                  color: AppTheme.colors.primary,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '“Lembre-se: ninguém tem as respostas para a sua vida além de você”',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.colors.primary,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Como você está se sentindo hoje?',
                  style: TextStyle(
                    color: AppTheme.colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                    children: triple.state.moods.map((mood) {
                  return ChoiceChip(
                    labelPadding: const EdgeInsets.all(5),
                    backgroundColor: const Color(0XFFE9E5FF),
                    selectedColor: const Color(0XFFE9E5FF),
                    shape: const CircleBorder(),
                    label: SvgPicture.asset(
                      mood.id == triple.state.selectedMood?.id
                          ? mood.typeIcon.selectedIcon
                          : mood.typeIcon.moodIcon,
                    ),
                    selected: mood.id == triple.state.selectedMood?.id,
                    onSelected: (bool selected) {
                      if (selected) {
                        store.onChangeMood(mood);
                      }
                    },
                  );
                }).toList())
              ],
            ),
          ],
        )),
        actions: [
          triple.state.selectedMood != null
              ? TextButton(
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async => await store.postMood(),
                )
              : Container(),
        ],
      );
    });
  }
}
