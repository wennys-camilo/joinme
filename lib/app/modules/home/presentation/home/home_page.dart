import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/presentation/pages/reload_error_page.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../../../shared/presentation/utils/extension/string_extension_capitalize.dart';
import '../widgets/categories_title_widget.dart';
import '../widgets/custom_filter_chip_widget.dart';
import '../widgets/event_item_card_tile.dart';
import '../widgets/insights_card_tile.dart';
import '../widgets/mood_dialog_widget.dart';
import 'home_state.dart';
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
    verifyMood();
    store.getFavorites();
    fetchEvents();
  }

  void fetchEvents() {
    Future.wait(
        [store.fetchEvents(), store.userDrivenEvents(), store.fetchTips()]);
  }

  Future<void> verifyMood() async {
    await store.checkShowMood();
    if (store.state.showMood) {
      await store.fechMoods();
      showMood();
    }
  }

  showMood() async {
    await Future.delayed(const Duration(milliseconds: 50));
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const MoodDialogWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TripleBuilder<HomeStore, Failure, HomeState>(
        builder: (context, triple) {
      if (triple.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (triple.error != null) {
        return ReloadErrorPage(
          message: triple.error!.message,
          action: () {
            fetchEvents();
          },
        );
      }

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
                          child: Image.asset(
                            AppTheme.images.luma,
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
                              'Olá, ${store.userStore.state.user.name.toTitleCase()}!',
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
                                    color: AppTheme.colors.greyLight),
                                child: Icon(
                                  Icons.notifications,
                                  color: AppTheme.colors.primary,
                                ),
                              ),
                              Visibility(
                                visible: false,
                                child: Positioned(
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
                            borderSide:
                                BorderSide(color: AppTheme.colors.black),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SizedBox(
                      height: 40,
                      child: ListView.builder(
                        itemCount: triple.state.filterCategory.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final categorie = triple.state.filterCategory[index];
                          return CustomFilterChipWidget(
                            selectedColor: AppTheme.colors.primary,
                            colorText: triple.state.selecTedCategory
                                    .contains(categorie)
                                ? AppTheme.colors.white
                                : AppTheme.colors.primary,
                            chipColor: AppTheme.colors.primary,
                            label: categorie,
                            onSelected: (value) =>
                                store.selectedChangeCategorie(categorie),
                            selected: triple.state.selecTedCategory
                                .contains(categorie),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CategoriesTitleWidget(title: 'Acessibilidade'),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 8),
                    height: 40,
                    child: ListView.builder(
                      itemCount: triple.state.filterAccessibility.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final accessibility =
                            triple.state.filterAccessibility[index];
                        return CustomFilterChipWidget(
                          chipColor: AppTheme.colors.pink,
                          selectedColor: AppTheme.colors.pink,
                          colorText: triple.state.selectedAccessibility
                                  .contains(accessibility)
                              ? AppTheme.colors.white
                              : AppTheme.colors.pink,
                          label: accessibility,
                          onSelected: (value) =>
                              store.selectedChangeAccessibility(accessibility),
                          selected: triple.state.selectedAccessibility
                              .contains(accessibility),
                        );
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
                    height: MediaQuery.of(context).size.height * 0.25,
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
                          child: EventItemCardTile(
                            event: promoted,
                            favorite: store.isFavorite(promoted.id),
                          ),
                        );
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
                  triple.state.userDrivenEventsList.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: triple.state.events.length,
                            itemBuilder: (BuildContext context, int index) {
                              var event = triple.state.events[index];
                              return GestureDetector(
                                  onTap: () {
                                    Modular.to.pushNamed('./eventPage',
                                        arguments: event);
                                  },
                                  child: EventItemCardTile(
                                    event: event,
                                    favorite: store.isFavorite(event.id),
                                  ));
                            },
                          ),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: triple.state.userDrivenEventsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              var event =
                                  triple.state.userDrivenEventsList[index];
                              return GestureDetector(
                                  onTap: () {
                                    Modular.to.pushNamed('./eventPage',
                                        arguments: event);
                                  },
                                  child: EventItemCardTile(
                                    event: event,
                                    favorite: store.isFavorite(event.id),
                                  ));
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
                  triple.state.onlineEvents.isNotEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: triple.state.onlineEvents.length,
                            itemBuilder: (BuildContext context, int index) {
                              var event = triple.state.onlineEvents[index];
                              return GestureDetector(
                                  onTap: () {
                                    Modular.to.pushNamed('./eventPage',
                                        arguments: event);
                                  },
                                  child: EventItemCardTile(
                                    event: event,
                                    favorite: store.isFavorite(event.id),
                                  ));
                            },
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const CategoriesTitleWidget(title: 'Dicas e bem estar'),
                      const Expanded(
                          child: SizedBox(
                        width: 5,
                      )),
                      GestureDetector(
                        onTap: () => Modular.to.pushNamed('./wellness',
                            arguments: triple.state.tipsList),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            'Ver todas',
                            style: TextStyle(
                                color: AppTheme.colors.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  triple.state.tipsList.isNotEmpty
                      ? SizedBox(
                          height: 168,
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 160 / 168,
                                    crossAxisCount: 1,
                                    mainAxisSpacing: 4),
                            itemCount: triple.state.tipsList.length,
                            itemBuilder: (context, index) {
                              final tip = triple.state.tipsList[index];
                              return GestureDetector(
                                onTap: (() {}),
                                child: InsightsCardTile(
                                  title: tip.title,
                                  description: tip.description,
                                  image: tip.imageUrl,
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
                  const SizedBox(height: 24)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
