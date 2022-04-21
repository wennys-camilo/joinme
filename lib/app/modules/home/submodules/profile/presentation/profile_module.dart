import 'package:camp_final/app/modules/home/submodules/profile/presentation/profile_page.dart';
import 'package:camp_final/app/modules/home/submodules/profile/presentation/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ProfileStore(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ProfilePage()),
  ];
}
