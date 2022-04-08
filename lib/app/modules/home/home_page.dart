import 'package:camp_final/app/modules/home/widgets/horizontal_grid_view.dart';
import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  final String categories;
  final String events;
  final String name;
  const HomePage(
      {Key? key,
      this.title = "Home",
      this.categories = "Categorias",
      this.events = "Eventos #",
      this.name = "Nome"})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(29, 70, 0, 30),
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
                        child: Container(
                          child: Text(
                            'Olá, ${widget.name}!',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.colors.primary),
                          ),
                          color: AppTheme.colors.grey,
                          width: 200,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.colors.grey),
                        height: 46,
                        width: 46,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(29, 0, 32, 48),
                  child: SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search),
                          iconColor: AppTheme.colors.primary,
                          fillColor: AppTheme.colors.greyBoard,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40), borderSide: BorderSide(color: AppTheme.colors.greyBoard),
                          ), focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),borderSide: BorderSide(color: AppTheme.colors.greyBoard),
                          )
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Eventos Próximos',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'ver todos',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 158,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: HorizontalGridView(
                      widget: widget,
                      events: widget.events,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(39, 29, 0, 3),
                  child: Align(
                    child: Text(
                      'Categorias',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: Container(
                              width: 84,
                              color: AppTheme.colors.grey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.categories,
                                    style: const TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Insights',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.colors.grey),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Ver todos',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          )),
                    ],
                  ),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 38, 40, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recém adicionados',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.colors.grey)),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Ver todos',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 158,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: HorizontalGridView(
                        events: widget.events, widget: widget),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 38, 40, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Eventos Online', style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.colors.grey),),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Ver todos',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 158,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: HorizontalGridView(
                        events: widget.events, widget: widget),
                  ),
                ),
                const SizedBox(
                  height: 48,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
