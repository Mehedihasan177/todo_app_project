import 'package:get_it/get_it.dart';
import 'package:todo_app_project/course_details_play/data/repository_implement/course_repository_implement.dart';
import 'package:todo_app_project/course_details_play/data/services/course_services.dart';
import 'package:todo_app_project/course_details_play/domain/repository/course_repository.dart';




final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory<CourseDetailsServices>(() => CourseDetailsServices());
  locator.registerFactory<CourseDetailsRepository>(() => CourseDetailsRepositoryImplement(locator()));
}