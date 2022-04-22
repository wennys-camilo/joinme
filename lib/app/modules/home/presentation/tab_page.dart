import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
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
    _changeBar(0);
    Modular.to.navigate('/home/homePage');
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
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppTheme.colors.greyLight,
              selectedItemColor: AppTheme.colors.pink,
              currentIndex: value,
              onTap: (value) {
                if (value == currentIndex.value) {
                  return;
                } else {
                  switch (value) {
                    case 0:
                      Modular.to.navigate('/home/homePage');
                      break;
                    case 1:
                      Modular.to.navigate('/home/calendar');
                      break;
                    case 2:
                      Modular.to.navigate('/home/add_events/');
                      break;
                    case 3:
                      Modular.to.navigate('/home/saved/');
                      break;
                    case 4:
                      Modular.to.navigate('/home/profile/');
                      break;
                    default:
                  }
                }
                _changeBar(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppTheme.icons.home),
                  label: 'Home',
                  activeIcon: SvgPicture.asset(AppTheme.icons.homeSelected),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppTheme.icons.calendar),
                  label: 'Calendário',
                  activeIcon: SvgPicture.asset(AppTheme.icons.calendarSelected),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppTheme.icons.event),
                  label: 'Criar',
                  activeIcon: SvgPicture.asset(AppTheme.icons.eventSelected),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppTheme.icons.saveds),
                  label: 'Salvos',
                  activeIcon: SvgPicture.asset(AppTheme.icons.savedsSelected),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppTheme.icons.user),
                  label: 'Perfil',
                  activeIcon: SvgPicture.asset(AppTheme.icons.userSelected),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
