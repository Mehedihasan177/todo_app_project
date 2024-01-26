import '../repository/course_repository.dart';

abstract class ToDoDetailsUseCase {
  final ToDoDetailsRepository toDoRepository;

  ToDoDetailsUseCase(this.toDoRepository);
}