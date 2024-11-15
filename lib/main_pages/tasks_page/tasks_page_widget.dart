import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/confirm_action/confirm_action_widget.dart';
import '/components/list_items/empty_list_display/empty_list_display_widget.dart';
import '/components/list_items/task_card/task_card_widget.dart';
import '/components/new_task_notification/new_task_notification_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'tasks_page_model.dart';
export 'tasks_page_model.dart';

class TasksPageWidget extends StatefulWidget {
  const TasksPageWidget({super.key});

  @override
  State<TasksPageWidget> createState() => _TasksPageWidgetState();
}

class _TasksPageWidgetState extends State<TasksPageWidget>
    with TickerProviderStateMixin {
  late TasksPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TasksPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tasksList = await queryTasksRecordOnce(
        parent: currentUserReference,
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TasksRecord>>(
      stream: queryTasksRecord(
        parent: currentUserReference,
      )..listen((snapshot) {
          List<TasksRecord> tasksPageTasksRecordList = snapshot;
          if (_model.tasksPagePreviousSnapshot != null &&
              !const ListEquality(TasksRecordDocumentEquality()).equals(
                  tasksPageTasksRecordList, _model.tasksPagePreviousSnapshot)) {
            () async {
              _model.newTasksList = await queryTasksRecordOnce(
                parent: currentUserReference,
              );

              safeSetState(() {});
            }();
          }
          _model.tasksPagePreviousSnapshot = snapshot;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<TasksRecord> tasksPageTasksRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: responsiveVisibility(
              context: context,
              tabletLandscape: false,
            )
                ? AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pop();
                      },
                    ),
                    actions: const [],
                    centerTitle: true,
                    elevation: 0.0,
                  )
                : null,
            body: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 900.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tasks',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.newTaskNotificationModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: const NewTaskNotificationWidget(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: const Alignment(0.0, 0),
                                      child: FlutterFlowButtonTabBar(
                                        useToggleButtonStyle: true,
                                        isScrollable: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        unselectedLabelStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        unselectedBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderWidth: 2.0,
                                        borderRadius: 12.0,
                                        elevation: 0.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                16.0, 0.0, 16.0, 0.0),
                                        buttonMargin:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 16.0, 0.0),
                                        tabs: const [
                                          Tab(
                                            text: 'Incomplete',
                                            icon: Icon(
                                              Icons.check_box_outline_blank,
                                            ),
                                          ),
                                          Tab(
                                            text: 'Complete',
                                            icon: Icon(
                                              Icons.check_box_outlined,
                                            ),
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [() async {}, () async {}][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 0.0, 16.0,
                                                          24.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            final incompleteTaskList =
                                                                tasksPageTasksRecordList
                                                                    .where((e) =>
                                                                        e.status ==
                                                                        TaskStatus
                                                                            .incomplete)
                                                                    .toList();
                                                            if (incompleteTaskList
                                                                .isEmpty) {
                                                              return const EmptyListDisplayWidget(
                                                                itemName:
                                                                    'Incomplete Tasks',
                                                              );
                                                            }

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  incompleteTaskList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  incompleteTaskListIndex) {
                                                                final incompleteTaskListItem =
                                                                    incompleteTaskList[
                                                                        incompleteTaskListIndex];
                                                                return wrapWithModel(
                                                                  model: _model
                                                                      .taskCardModels1
                                                                      .getModel(
                                                                    incompleteTaskListIndex
                                                                        .toString(),
                                                                    incompleteTaskListIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      TaskCardWidget(
                                                                    key: Key(
                                                                      'Keyexn_${incompleteTaskListIndex.toString()}',
                                                                    ),
                                                                    task:
                                                                        incompleteTaskListItem,
                                                                    checkBoxStatus:
                                                                        false,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 0.0, 16.0,
                                                          24.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            final completeTaskList =
                                                                tasksPageTasksRecordList
                                                                    .where((e) =>
                                                                        e.status ==
                                                                        TaskStatus
                                                                            .complete)
                                                                    .toList();
                                                            if (completeTaskList
                                                                .isEmpty) {
                                                              return const EmptyListDisplayWidget(
                                                                itemName:
                                                                    'Complete Tasks',
                                                              );
                                                            }

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  completeTaskList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  completeTaskListIndex) {
                                                                final completeTaskListItem =
                                                                    completeTaskList[
                                                                        completeTaskListIndex];
                                                                return wrapWithModel(
                                                                  model: _model
                                                                      .taskCardModels2
                                                                      .getModel(
                                                                    completeTaskListIndex
                                                                        .toString(),
                                                                    completeTaskListIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      TaskCardWidget(
                                                                    key: Key(
                                                                      'Key6pj_${completeTaskListIndex.toString()}',
                                                                    ),
                                                                    task:
                                                                        completeTaskListItem,
                                                                    checkBoxStatus:
                                                                        true,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 30.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: const ConfirmActionWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.confirm = value));

                                    if (_model.confirm!) {
                                      _model.completeTasks =
                                          await queryTasksRecordOnce(
                                        parent: currentUserReference,
                                        queryBuilder: (tasksRecord) =>
                                            tasksRecord.where(
                                          'status',
                                          isEqualTo:
                                              TaskStatus.complete.serialize(),
                                        ),
                                      );
                                      if (_model.completeTasks!.isNotEmpty) {
                                        _model.loopCounter = 0;
                                        safeSetState(() {});
                                        while (_model.completeTasks!.length >
                                            _model.loopCounter) {
                                          _model.completeTaskDoc =
                                              await queryTasksRecordOnce(
                                            parent: currentUserReference,
                                            queryBuilder: (tasksRecord) =>
                                                tasksRecord.where(
                                              'status',
                                              isEqualTo: TaskStatus.complete
                                                  .serialize(),
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          await _model
                                              .completeTaskDoc!.reference
                                              .delete();
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'No Complete Tasks',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }

                                      _model.loopCounter = 0;
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'Clear Complete Tasks',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
