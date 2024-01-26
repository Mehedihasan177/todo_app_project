import 'package:get_it/get_it.dart';
import 'package:todo_app_project/features/todo_details/data/repository_implement/todo_repository_implement.dart';
import 'package:todo_app_project/features/todo_details/data/services/todo_services.dart';
import 'package:todo_app_project/features/todo_details/domain/repository/todo_repository.dart';




final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory<ToDoDetailsServices>(() => ToDoDetailsServices());
  locator.registerFactory<ToDoDetailsRepository>(() => ToDoDetailsRepositoryImplement(locator()));
}