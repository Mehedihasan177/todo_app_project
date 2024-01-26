import 'package:get_it/get_it.dart';
import 'package:todo_app_project/features/todo_details/data/repository_implement/course_repository_implement.dart';
import 'package:todo_app_project/features/todo_details/data/services/course_services.dart';
import 'package:todo_app_project/features/todo_details/domain/repository/course_repository.dart';




final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory<ToDoDetailsServices>(() => ToDoDetailsServices());
  locator.registerFactory<ToDoDetailsRepository>(() => ToDoDetailsRepositoryImplement(locator()));
}