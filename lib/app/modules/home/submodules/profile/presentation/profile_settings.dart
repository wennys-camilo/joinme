import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/presentation/themes/app_theme.dart';
import 'widgets/item_tile_menu_widget.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.colors.greyLight,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Modular.to.navigate('/home/profile/'),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.arrow_back,
                  color: AppTheme.colors.primary,
                  size: 40,
                ),
              )),
          backgroundColor: AppTheme.colors.transparent,
          elevation: 0,
          title: Text(
            'Configurações',
            style: TextStyle(
                color: AppTheme.colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 5),
          children: [
            const SizedBox(
              height: 10,
            ),
            ItemTileMenuWidget(
              icon: AppTheme.icons.user,
              title: 'Editar perfil',
            ),
            const SizedBox(
              height: 5,
            ),
            ItemTileMenuWidget(
              icon: AppTheme.icons.notification,
              title: 'Notificações',
            ),
            const SizedBox(
              height: 5,
            ),
            ItemTileMenuWidget(
              icon: AppTheme.icons.look,
              title: 'Segurança',
            ),
            const SizedBox(
              height: 5,
            ),
            ItemTileMenuWidget(
              icon: AppTheme.icons.invite,
              title: 'Convidar amigos',
            ),
            const SizedBox(
              height: 5,
            ),
            ItemTileMenuWidget(
              icon: AppTheme.icons.help,
              title: 'Ajuda',
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () => Modular.to.navigate('/login/'),
              child: ItemTileMenuWidget(
                icon: AppTheme.icons.logout,
                title: 'Sair da conta',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
