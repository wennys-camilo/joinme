import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../domain/entities/wellness_entity.dart';
import '../home/home_store.dart';
import '../widgets/insights_card_tile.dart';

class WellnessPage extends StatefulWidget {
  final List<WellnessEntity> tipList;

  const WellnessPage({Key? key, required this.tipList}) : super(key: key);

  @override
  State<WellnessPage> createState() => _WellnessPageState();
}

class _WellnessPageState extends ModularState<WellnessPage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppTheme.colors.primary,
                size: 35,
              ),
              onPressed: () => Modular.to.navigate('/home/homePage')),
          title: Text(
            'Dicas de bem-estar',
            style: TextStyle(
              color: AppTheme.colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 160 / 160,
              crossAxisCount: 2,
              mainAxisSpacing: 4),
          itemCount: widget.tipList.length,
          itemBuilder: (BuildContext ctx, index) {
            final insight = widget.tipList[index];
            return InsightsCardTile(
                title: insight.title,
                description: insight.description,
                image: insight.imageUrl);
          },
        ),
      ),
    );
  }
}
