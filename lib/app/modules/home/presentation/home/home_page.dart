import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../../../shared/presentation/utils/extension/string_extension_capitalize.dart';
import '../widgets/categories_title_widget.dart';
import '../widgets/event_item_card_tile.dart';
import '../widgets/custom_filter_chip_widget.dart';
import '../widgets/insights_horizontal_grid_view.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 24, top: 20),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          'https://i.ibb.co/d2CzTcn/Vector-8.png',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          child: Text(
                            'Olá, ${store.userStore.state.user.name.capitalize()}!',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.colors.black),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 40,
                        child: Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.colors.greyBoard),
                              child: Icon(
                                Icons.notifications,
                                color: AppTheme.colors.primary,
                              ),
                            ),
                            Positioned(
                              top: 2,
                              right: 1,
                              child: Container(
                                child: const Center(
                                  child: Text(
                                    '9',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 10),
                  child: SizedBox(
                    child: TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15),
                        suffixIcon: const Icon(Icons.search),
                        iconColor: AppTheme.colors.primary,
                        fillColor: AppTheme.colors.white,
                        filled: true,
                        hintText: 'Pesquisar',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppTheme.colors.primary),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CategoriesTitleWidget(
                  title: 'Categorias',
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomFilterChipWidget(
                          chipColor: AppTheme.colors.primary);
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CategoriesTitleWidget(title: 'Acessibilidade'),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomFilterChipWidget(
                          chipColor: AppTheme.colors.pink);
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CategoriesTitleWidget(
                  title: 'Eventos Impulsionados',
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: store.state.promotedEvents.length,
                    itemBuilder: (BuildContext context, int index) {
                      var promoted = store.state.promotedEvents[index];
                      return GestureDetector(
                          onTap: () {
                            Modular.to
                                .pushNamed('./eventPage', arguments: promoted);
                          },
                          child: EventItemCardTile(event: promoted));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CategoriesTitleWidget(
                  title: 'Eventos Próximos',
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: store.state.events.length,
                    itemBuilder: (BuildContext context, int index) {
                      var event = store.state.events[index];
                      return GestureDetector(
                          onTap: () {
                            Modular.to
                                .pushNamed('./eventPage', arguments: event);
                          },
                          child: EventItemCardTile(event: event));
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 16,
                ),
                const CategoriesTitleWidget(title: 'Eventos Online'),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: store.state.events.length,
                    itemBuilder: (BuildContext context, int index) {
                      var event = store.state.events[index];
                      return GestureDetector(
                          onTap: () {
                            Modular.to
                                .pushNamed('./eventPage', arguments: event);
                          },
                          child: EventItemCardTile(event: event));
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CategoriesTitleWidget(title: 'Insights'),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                    height: 168,
                    child: InsightsHorizontalGridView(
                      title: 'Playlist para estudos',
                      description: 'sons para focar e relaxar',
                    )),
                const SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
