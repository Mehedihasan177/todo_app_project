
import '../../../../../../core/data/model/api_response.dart';
import '../../data/model/course_model.dart';
import 'course_usecase.dart';

class CourseDetailsPassUseCase extends CourseDetailsUseCase {
  CourseDetailsPassUseCase(super.jsonTaskRepository);

  Future<Response<List<TodoList>?>> call() async {
    return await jsonTaskRepository.fetchDataPass();
  }
}
class AddToDoListPassUseCase extends CourseDetailsUseCase {
  AddToDoListPassUseCase(super.jsonTaskRepository);

  Future<Future<TodoList?>> call({required String title, required String note, required String date, required String startTime, required String endTime}) async {
    return await jsonTaskRepository.addTodoList(title: title, note: note, date: date, startTime: startTime, endTime: endTime);
  }
}
class DeleteTodoPassUseCase extends CourseDetailsUseCase {
  DeleteTodoPassUseCase(super.jsonTaskRepository);

  Future<Future<TodoList?>> call({required String documentId}) async {
    return await jsonTaskRepository.deleteTodoItem(documentId: documentId);
  }
}
class CompleteTodoPassUseCase extends CourseDetailsUseCase {
  CompleteTodoPassUseCase(super.jsonTaskRepository);

  Future<Future<TodoList?>> call({required String documentId}) async {
    return await jsonTaskRepository.completeTodoItem(documentId: documentId);
  }
}