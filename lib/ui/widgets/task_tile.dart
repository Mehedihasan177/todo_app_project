import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_project/controllers/task_controller.dart';
import 'package:todo_app_project/models/task.dart';
import 'package:todo_app_project/ui/theme.dart';

class TaskTile extends StatelessWidget {
  TaskTile({Key? key, required this.task}) : super(key: key);
  final Task task;
  final TaskController _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    print(task.date);
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.17
          : 100,
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * 0.7,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: MediaQuery.of(context).orientation == Orientation.portrait
              ? 20
              : 0),
      decoration: BoxDecoration(
          color: task.color == 0 ? bluishClr : Colors.green,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${task.title}',
                    style: Themes().taskTileHeadingTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_sharp,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${task.startTime} - ${task.endTime}',
                              style: const TextStyle(color: Colors.white)),
                              Text(
                            '${task.date.toString()}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${task.note}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          task.isCompleted == 0
                              ?  InkWell(
                                onTap: (){
                                  _taskController.markAsCompleted(task.id);
                                },
                                child: const Icon(Icons.check_circle_rounded, color: Colors.green, size: 25,)) :
                                
                               const SizedBox(),

                               SizedBox(width: 15,),
                            InkWell(
                              onTap: (){
                                _taskController.deleteTask(task.id);
                              },
                              child: const Icon(Icons.delete_forever_rounded, color: Colors.red, size: 25)),
                                
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: task.isCompleted == 0
                ? const Text('TODO', style: TextStyle(color: Colors.white))
                : const Text('COMPLETED', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  
  }
}
