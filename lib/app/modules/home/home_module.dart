import 'presentation/home_page.dart';
import 'submodules/event_page/presentation/event_page.dart';
import 'submodules/profile/presentation/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/home_page.dart';
import 'presentation/home_store.dart';
import 'presentation/tab_page.dart';
import 'submodules/events/domain/usecases/fetch_accessibilities_events_usecase_impl.dart';
import 'submodules/events/domain/usecases/fetch_categories_event_usecase_impl.dart';
import 'submodules/events/external/datasources/events_remote_datasource_impl.dart';
import 'submodules/events/infra/repositories/events_repository_impl.dart';
import 'submodules/events/pages/add_events/add_event_page.dart';
import 'submodules/events/pages/add_events/add_event_store.dart';
import 'submodules/profile/presentation/profile_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),

    //TODO:
    Bind((i) => EventsRemoteDatasourceImpl(i.get())),
    Bind((i) => EventsRepositoryImpl(i.get())),
    Bind((i) => FetchAccessibilitiesEventsUsecaseImpl(i.get())),
    Bind((i) => FetchCategorieEventUsecaseImpl(i.get())),
    Bind((i) => AddEventStore(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const TabPage(),
      children: [
        ChildRoute('/homePage', child: (context, args) => const HomePage()),
        ChildRoute('/perfil',
            child: (context, args) => const Center(child: Text('2'))),
        ChildRoute('/add_events',
            child: (context, args) => const AddEventPage()),
        ChildRoute('/profile', child: (context, args) => const ProfilePage()),
        ChildRoute('/eventPage', child: (context, args) => const EventPage()),
      ],
    ),
  ];
}
