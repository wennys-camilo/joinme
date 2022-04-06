import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ValueNotifier<int> currentIndex;

  void _changeBar(int value) {
    currentIndex.value = value;
  }

  @override
  void initState() {
    super.initState();
    currentIndex = ValueNotifier<int>(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppTheme.colors.grey,
              currentIndex: value,
              onTap: (value) {
                switch (value) {
                  case 0:
                    Modular.to.navigate('./');
                    break;
                  case 1:
                    Modular.to.navigate('./perfil2');
                    break;
                  default:
                }
                _changeBar(value);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket),
                  label: 'teste',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket),
                  label: 'teste',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'teste',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'teste',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'teste',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
