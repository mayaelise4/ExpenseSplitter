import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'task_card_model.dart';
export 'task_card_model.dart';

class TaskCardWidget extends StatefulWidget {
  const TaskCardWidget({
    super.key,
    required this.task,
    required this.checkBoxStatus,
  });

  final TasksRecord? task;
  final bool? checkBoxStatus;

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  late TaskCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 12.0,
              borderWidth: 2.0,
              buttonSize: 40.0,
              fillColor: widget.task?.status == TaskStatus.incomplete
                  ? FlutterFlowTheme.of(context).accent1
                  : FlutterFlowTheme.of(context).primary,
              icon: Icon(
                Icons.check_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 20.0,
              ),
              onPressed: () async {
                if (widget.task?.status == TaskStatus.incomplete) {
                  await widget.task!.reference.update(createTasksRecordData(
                    status: TaskStatus.complete,
                  ));

                  await currentUserReference!.update({
                    ...mapToFirestore(
                      {
                        'ActionHistory': FieldValue.arrayUnion([
                          getHistoryFirestoreData(
                            createHistoryStruct(
                              itemName: widget.task?.tag,
                              actionDate: getCurrentTimestamp,
                              actionType: ActionTypes.completed,
                              actionLocation: ActionLocations.Tasks,
                              clearUnsetFields: true,
                            ),
                            true,
                          )
                        ]),
                      },
                    ),
                  });
                } else {
                  await widget.task!.reference.update(createTasksRecordData(
                    status: TaskStatus.incomplete,
                  ));
                }
              },
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 0.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: () {
                              if (widget.task?.type == TaskType.Goal) {
                                return 'Buy Your: ';
                              } else if (widget.task?.type == TaskType.Bill) {
                                return 'Pay Bill: ';
                              } else {
                                return 'info';
                              }
                            }(),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              () {
                                if (widget.task?.type == TaskType.Goal) {
                                  return widget.task?.goal.name;
                                } else if (widget.task?.type ==
                                    TaskType.Bill) {
                                  return widget.task?.bill.name;
                                } else {
                                  return 'item name';
                                }
                              }(),
                              'goal name',
                            ),
                            style: const TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 0.0),
                        child: Text(
                          dateTimeFormat(
                            "Md",
                            widget.task!.date!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          height: 28.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.task?.tag,
                                'tag',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
