import 'package:camp_final/app/modules/home/submodules/saved/presentation/saved_page.dart';
import 'package:camp_final/app/modules/home/submodules/saved/presentation/saved_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/usecases/fetch_all_status_events_attendees_usecase_impl.dart';
import '../../external/datasources/home_events_remote_datasource_impl.dart';
import '../../infra/repositories/home_events_repository_impl.dart';

class SavedModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeEventsRemoteDataSourceImpl(i.get())),
    Bind((i) => HomeEventsRepositoryImpl(i.get())),
    Bind((i) => FetchAllStatusEventsAttendeesUsecaseImpl(i.get())),
    Bind((i) => SavedStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SavedPage()),
  ];
}
