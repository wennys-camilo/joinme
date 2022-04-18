import 'package:camp_final/app/modules/home/domain/usecases/set_attendees_status_usecase_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/fetch_all_events_usecase_impl.dart';
import 'domain/usecases/fetch_all_status_events_attendees_usecase_impl.dart';
import 'external/datasources/home_events_remote_datasource_impl.dart';
import 'infra/repositories/home_events_repository_impl.dart';
import 'presentation/event_details/event_details_page.dart';
import 'presentation/event_details/event_details_store.dart';
import 'presentation/home/home_page.dart';
import 'presentation/home/home_store.dart';
import 'presentation/tab_page.dart';
import 'submodules/calendar/presentation/calendar_page.dart';
import 'submodules/events/domain/usecases/create_event_usecase_impl.dart';
import 'submodules/events/domain/usecases/fetch_accessibilities_events_usecase_impl.dart';
import 'submodules/events/domain/usecases/fetch_categories_event_usecase_impl.dart';
import 'submodules/events/external/datasources/events_remote_datasource_impl.dart';
import 'submodules/events/infra/repositories/events_repository_impl.dart';
import 'submodules/events/pages/add_events/add_event_page.dart';
import 'submodules/events/pages/add_events/add_event_store.dart';
import 'submodules/profile/presentation/profile_page.dart';
import 'submodules/saved/saved_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeEventsRemoteDataSourceImpl(i.get())),
    Bind((i) => HomeEventsRepositoryImpl(i.get())),
    Bind((i) => FetchAllEventsUsecaseImpl(i.get())),
    Bind((i) => SetAttendeesStatusUsecaseImpl(i.get())),
    Bind((i) => FetchAllStatusEventsAttendeesUsecaseImpl(i.get())),
    Bind((i) => HomeStore(i.get(), i.get(), i.get())),
    Bind((i) => EventDetailsStore(i.get(), i.get())),
    //TODO:
    Bind((i) => EventsRemoteDatasourceImpl(i.get())),
    Bind((i) => EventsRepositoryImpl(i.get())),
    Bind((i) => FetchAccessibilitiesEventsUsecaseImpl(i.get())),
    Bind((i) => FetchCategorieEventUsecaseImpl(i.get())),
    Bind((i) => CreateEventUsecaseImpl(i.get())),
    Bind((i) => AddEventStore(i.get(), i.get(), i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const TabPage(),
      children: [
        ChildRoute('/homePage', child: (context, args) => const HomePage()),
        ChildRoute('/calendar', child: (context, args) => const CalendarPage()),
        ModuleRoute('/saved', module: SavedModule()),
        //ChildRoute('/saved', child: (context, args) => const SavedPage()),
        ChildRoute('/add_events',
            child: (context, args) => const AddEventPage()),
        ChildRoute('/profile', child: (context, args) => const ProfilePage()),
        ChildRoute('/eventPage',
            child: (context, args) => EventDetailsPage(event: args.data)),
      ],
    ),
  ];
}
