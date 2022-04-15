import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/presentation/themes/app_theme.dart';
import '../../../shared/presentation/utils/extension/string_extension_capitalize.dart';
import '../../../shared/store/user/user_store.dart';
import 'home_store.dart';
import 'widgets/categories_title_widget.dart';
import 'widgets/event_horizontal_grid_view.dart';
import 'widgets/event_list_view_categories.dart';
import 'widgets/insights_horizontal_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  late final UserStore userStore;

  @override
  void initState() {
    super.initState();
    userStore = Modular.get<UserStore>();
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
              children: [
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 24),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (() => Modular.to.pushNamed('./userPage')),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.colors.primary),
                          height: 48,
                          width: 48,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          child: Text(
                            'Olá, ${userStore.state.user.name.capitalize()}!',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.colors.black.withOpacity(0.5)),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 40,
                        child: Stack(
                          children: [
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.colors.grey),
                            ),
                            Positioned(
                              top: 0,
                              right: 3,
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
                                      color: AppTheme.colors.primary)),
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
                            borderSide: BorderSide(
                                color: AppTheme.colors.black.withOpacity(0.5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppTheme.colors.primary),
                          )),
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
                  child: EventListViewcategories(
                    chipColor: AppTheme.colors.primary,
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
                  child: EventListViewcategories(
                    chipColor: AppTheme.colors.primary,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CategoriesTitleWidget(title: 'Eventos Impulsionados'),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 160,
                  child: EventHorizontalGridView(
                    widget: widget,
                    events: 'Evento',
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
                  height: 158,
                  child: EventHorizontalGridView(
                      events: 'eventos', widget: widget),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CategoriesTitleWidget(title: 'Eventos Online'),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 158,
                  child: EventHorizontalGridView(
                      events: 'eventos', widget: widget),
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
