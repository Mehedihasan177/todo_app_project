import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_project/core/app_component/app_component.dart';
import 'package:todo_app_project/course_details_play/domain/repository/course_repository.dart';
import 'package:todo_app_project/course_details_play/domain/usecase/course_pass_usecase.dart';
import 'package:todo_app_project/main.dart';
import 'package:todo_app_project/models/task.dart';
import 'package:todo_app_project/ui/widgets/custom_toast.dart';

import '../course_details_play/data/model/course_model.dart';

class TaskController extends GetxController {
  final RxList taskList = <Task>[].obs;
  var selectDate = DateTime.now().obs;
 RxList<TodoList> dataList = <TodoList>[].obs;
   final Rx<TextEditingController> titleController = TextEditingController().obs;
  final Rx<TextEditingController> noteController = TextEditingController().obs;
  final Rx<TextEditingController> dateController = TextEditingController().obs;
  final Rx<TextEditingController> startTimeController = TextEditingController().obs;
  final Rx<TextEditingController> endTimeController = TextEditingController().obs;

final RxBool isAddTodoItem = false.obs;
final RxBool isComplete = false.obs;
final RxBool isLoading = false.obs;
 DateTime  selectedDate = DateTime.now();
 TimeOfDay  selecteTime = TimeOfDay.now();
  RxString startDate = DateFormat('hh:mm a').format(DateTime.now()).obs;
  RxString endDate =
      DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 15))).obs;

  Future<RxList> fetchToDoList() async {
    isLoading.value = true;
    dataList.clear();
    try {
      final questionPassUseCase = CourseDetailsPassUseCase(locator<CourseDetailsRepository>());
      var response = await questionPassUseCase();
      print("response ${response.data?.first.startTime}");
      // Additional logic based on the response
      if (response.data != null) {
        dataList.addAll(response.data!);
        isLoading.value = false;
      }
      print(dataList.first.startTime);
    } catch (error) {
      // isLoading.value = false;
      print("Error loading data: $error");
      // Handle errors here, if needed
    }finally{
      isLoading.value = false;
    }

    return dataList;
  }
  Future<void> addToDoList() async {
    isAddTodoItem.value = true;
    try {
      final addToDoListPassUseCase = AddToDoListPassUseCase(locator<CourseDetailsRepository>());
      var response = await addToDoListPassUseCase(title: titleController.value.text, note: noteController.value.text, date: dateController.value.text, startTime: startTimeController.value.text, endTime: endTimeController.value.text);
      print("response ${response.isBlank}");
      if (response.isBlank == false) {
// successToast(context: navigatorKey.currentContext!, msg: "Successfully Added");
        isAddTodoItem.value = false;
      }
      
    } catch (error) {
      print("Error loading data: $error");
      errorToast(context: navigatorKey.currentContext!, msg: error.toString());
      // Handle errors here, if needed
    }

    // return dataList;
  }
  Future<void> deleteTodoList({String? documentId}) async {
    isAddTodoItem.value = true;
    try {
      final addToDoListPassUseCase = DeleteTodoPassUseCase(locator<CourseDetailsRepository>());
      var response = await addToDoListPassUseCase(documentId: documentId ?? '');
      print("response ${response.isBlank}");
      if (response.isBlank == false) {
// successToast(context: navigatorKey.currentContext!, msg: "Successfully Added");
        isAddTodoItem.value = false;
      }
      
    } catch (error) {
      print("Error loading data: $error");
      errorToast(context: navigatorKey.currentContext!, msg: error.toString());
      // Handle errors here, if needed
    }
  }
  Future<void> completeTodoListItem({String? documentId}) async {
    isComplete.value = true;
    try {
      final addToDoListPassUseCase = CompleteTodoPassUseCase(locator<CourseDetailsRepository>());
      var response = await addToDoListPassUseCase(documentId: documentId ?? '');
      print("response ${response.isBlank}");
      if (response.isBlank == false) {
// successToast(context: navigatorKey.currentContext!, msg: "Successfully Added");
        isComplete.value = false;
      }
      
    } catch (error) {
      print("Error loading data: $error");
      errorToast(context: navigatorKey.currentContext!, msg: error.toString());
      // Handle errors here, if needed
    }finally{
      isComplete.value = false;
    }
  }
void clearData(){
  dataList.clear();
  titleController.value.text = '';
  noteController.value.text = '';
  startTimeController.value.text = '';
  endTimeController.value.text = '';
  dateController.value.text = '';
  isAddTodoItem.value = false;
}
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbar({required String message, required BuildContext context, required MaterialColor color}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: color,
    content: Text(message),
  ));
}

}
