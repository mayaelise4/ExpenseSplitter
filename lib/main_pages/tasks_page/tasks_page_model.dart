import '/backend/backend.dart';
import '/components/list_items/task_card/task_card_widget.dart';
import '/components/new_task_notification/new_task_notification_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tasks_page_widget.dart' show TasksPageWidget;
import 'package:flutter/material.dart';

class TasksPageModel extends FlutterFlowModel<TasksPageWidget> {
  ///  Local state fields for this page.

  int loopCounter = 0;

  ///  State fields for stateful widgets in this page.

  List<TasksRecord>? tasksPagePreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in tasksPage widget.
  List<TasksRecord>? tasksList;
  // Stores action output result for [Firestore Query - Query a collection] action in tasksPage widget.
  List<TasksRecord>? newTasksList;
  // Model for NewTaskNotification component.
  late NewTaskNotificationModel newTaskNotificationModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for taskCard dynamic component.
  late FlutterFlowDynamicModels<TaskCardModel> taskCardModels1;
  // Models for taskCard dynamic component.
  late FlutterFlowDynamicModels<TaskCardModel> taskCardModels2;
  // Stores action output result for [Bottom Sheet - confirmAction] action in clearTasks widget.
  bool? confirm;
  // Stores action output result for [Firestore Query - Query a collection] action in clearTasks widget.
  List<TasksRecord>? completeTasks;
  // Stores action output result for [Firestore Query - Query a collection] action in clearTasks widget.
  TasksRecord? completeTaskDoc;

  @override
  void initState(BuildContext context) {
    newTaskNotificationModel =
        createModel(context, () => NewTaskNotificationModel());
    taskCardModels1 = FlutterFlowDynamicModels(() => TaskCardModel());
    taskCardModels2 = FlutterFlowDynamicModels(() => TaskCardModel());
  }

  @override
  void dispose() {
    newTaskNotificationModel.dispose();
    tabBarController?.dispose();
    taskCardModels1.dispose();
    taskCardModels2.dispose();
  }
}
