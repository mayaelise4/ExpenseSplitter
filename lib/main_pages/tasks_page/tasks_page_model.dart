import '/backend/backend.dart';
import '/components/list_items/task_card/task_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tasks_page_widget.dart' show TasksPageWidget;
import 'package:flutter/material.dart';

class TasksPageModel extends FlutterFlowModel<TasksPageWidget> {
  ///  State fields for stateful widgets in this page.

  List<TasksRecord>? tasksPagePreviousSnapshot;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for taskCard dynamic component.
  late FlutterFlowDynamicModels<TaskCardModel> taskCardModels1;
  // Models for taskCard dynamic component.
  late FlutterFlowDynamicModels<TaskCardModel> taskCardModels2;

  @override
  void initState(BuildContext context) {
    taskCardModels1 = FlutterFlowDynamicModels(() => TaskCardModel());
    taskCardModels2 = FlutterFlowDynamicModels(() => TaskCardModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    taskCardModels1.dispose();
    taskCardModels2.dispose();
  }
}
