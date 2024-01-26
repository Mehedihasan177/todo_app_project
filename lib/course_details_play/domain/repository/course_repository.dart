
import '../../../../../core/data/model/api_response.dart';
import '../../data/model/course_model.dart';
import '../../data/services/course_services.dart';

abstract class CourseDetailsRepository {
  final CourseDetailsServices fetchDataServices;

  CourseDetailsRepository(this.fetchDataServices);

  Future<Response<List<TodoList>?>> fetchDataPass();
  Future<Future<TodoList?>> addTodoList({required String title, required String note, required String date, required String startTime, required String endTime});
  Future<Future<TodoList?>> deleteTodoItem({required String documentId});
  Future<Future<TodoList?>> completeTodoItem({required String documentId});
}