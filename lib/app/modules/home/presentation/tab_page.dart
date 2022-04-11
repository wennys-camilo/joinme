import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "../../../shared/presentation/themes/app_theme.dart";

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
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
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppTheme.colors.grey,
            currentIndex: value,
            onTap: (value) {
              if (value == currentIndex.value) {
                _changeBar(value);
                return;
              } else {
                switch (value) {
                  case 0:
                    Modular.to.pushNamed('./homePage');
                    break;
                  case 1:
                    Modular.to.pushNamed('./perfil');
                    break;
                  case 2:
                    Modular.to.pushNamed('./add_events');
                    break;
                  case 3:
                    break;
                  case 4:
                    Modular.to.pushNamed('./profile');
                    break;
                  default:
                }
              }
              _changeBar(value);
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 35,
                ),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month,
                  size: 35,
                ),
                label: 'Calendário',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 25,
                  backgroundColor: AppTheme.colors.primary,
                  child: Icon(
                    Icons.add_outlined,
                    size: 40,
                    color: AppTheme.colors.white,
                  ),
                ),
                label: "",
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark,
                  size: 35,
                ),
                label: 'Salvos',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 35,
                ),
                label: 'Perfil',
              ),
            ],
          );
        },
      ),
    );
  }
}
