import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/presentation/themes/app_theme.dart';
import '../../../shared/presentation/utils/extension/string_extension_capitalize.dart';
import 'home_store.dart';
import 'widgets/horizontal_grid_view.dart';
import 'widgets/section_label_title_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(29, 60, 26, 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (() => Modular.to.pushNamed('./userPage')),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.colors.primary),
                        height: 49,
                        width: 49,
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
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.colors.primary),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppTheme.colors.grey),
                      height: 46,
                      width: 46,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(29, 0, 32, 48),
                child: SizedBox(
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15),
                        suffixIcon: const Icon(Icons.search),
                        iconColor: AppTheme.colors.primary,
                        fillColor: AppTheme.colors.greyBoard,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: AppTheme.colors.greyBoard),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: AppTheme.colors.greyBoard),
                        )),
                  ),
                ),
              ),
              SectionLabelTitleWidget(
                titleSection: 'Eventos Próximos',
                onPressed: () {},
              ),
              SizedBox(
                height: 158,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: HorizontalGridView(
                    widget: widget,
                    events: 'Evento',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(39, 29, 0, 3),
                child: Align(
                  child: Text(
                    'Categorias',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment.bottomLeft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: FilterChip(
                            backgroundColor: AppTheme.colors.grey,
                            label: Text(
                              'categorias',
                              style: TextStyle(color: AppTheme.colors.white),
                            ),
                            onSelected: (b) {},
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SectionLabelTitleWidget(
                titleSection: 'Insights',
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                        color: AppTheme.colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SectionLabelTitleWidget(
                  titleSection: 'Recem Adicionados', onPressed: () {}),
              SizedBox(
                height: 158,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: HorizontalGridView(events: 'eventos', widget: widget),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SectionLabelTitleWidget(
                  titleSection: 'Eventos Online', onPressed: () {}),
              SizedBox(
                height: 158,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: HorizontalGridView(events: 'eventos', widget: widget),
                ),
              ),
              const SizedBox(
                height: 48,
              )
            ],
          ),
        ),
      ),
    );
  }
}
