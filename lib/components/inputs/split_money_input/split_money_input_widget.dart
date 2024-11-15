import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'split_money_input_model.dart';
export 'split_money_input_model.dart';

class SplitMoneyInputWidget extends StatefulWidget {
  const SplitMoneyInputWidget({
    super.key,
    required this.inputtedAmount,
  });

  final double? inputtedAmount;

  @override
  State<SplitMoneyInputWidget> createState() => _SplitMoneyInputWidgetState();
}

class _SplitMoneyInputWidgetState extends State<SplitMoneyInputWidget> {
  late SplitMoneyInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplitMoneyInputModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // gets number of incomplete goals and splits input money between them into splitAmount
      _model.splitAmount = ((widget.inputtedAmount!) /
          (currentUserDocument?.goals.toList() ?? [])
              .where((e) => e.progress != FFAppConstants.one)
              .toList()
              .length
              .toDouble());
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x23000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                'Would you like to split this money?',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Inter Tight',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
              child: Text(
                'Confirm to split into goals',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Text(
              'Cancel to add to pocket',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
            Divider(
              height: 24.0,
              thickness: 2.0,
              indent: 10.0,
              endIndent: 10.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FFButtonWidget(
                  onPressed: FFAppState().splitConfirm
                      ? null
                      : () async {
                          Navigator.pop(context);
                        },
                  text: 'Cancel',
                  icon: const Icon(
                    Icons.not_interested_sharp,
                    size: 20.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconAlignment: IconAlignment.start,
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                    disabledColor: FlutterFlowTheme.of(context).accent1,
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    _model.loopCount = 0;
                    // sets the confirm to true so the inputMoney Component knows not to add the money to pocket, the money gets split to goals
                    FFAppState().splitConfirm = true;
                    // loops over goals to find the correct ones to update
                    while (_model.loopCount < FFAppState().goals.length) {
                      // checks if the goal is already complete, if not then true
                      if (FFAppState().goals[_model.loopCount].progress !=
                          FFAppConstants.one) {
                        // adds the splitAmount into the goal
                        FFAppState().updateGoalsAtIndex(
                          _model.loopCount,
                          (e) => e..incrementAddedAmount(_model.splitAmount),
                        );
                        // if the addedAmount of a goal is larger than the required amount then it needs to return the overflow of money to pocket and set that goal as complete
                        if (FFAppState().goals[_model.loopCount].addedAmount >=
                            FFAppState().goals[_model.loopCount].amount) {
                          // calculates overflow
                          _model.overflow =
                              FFAppState().goals[_model.loopCount].addedAmount -
                                  FFAppState().goals[_model.loopCount].amount;
                          // adds overflow back into pocket

                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'pocketAmount':
                                    FieldValue.increment(_model.overflow),
                              },
                            ),
                          });
                          // sets the goal as complete
                          FFAppState().updateGoalsAtIndex(
                            _model.loopCount,
                            (e) => e
                              ..progress = FFAppConstants.one
                              ..addedAmount =
                                  FFAppState().goals[_model.loopCount].amount,
                          );
                          FFAppState().incompleteTaskExists = true;
                          // creates new task for complete goal

                          await TasksRecord.createDoc(currentUserReference!)
                              .set(createTasksRecordData(
                            date: getCurrentTimestamp,
                            tag: 'Goal Reached',
                            goal: updateGoalStruct(
                              FFAppState().goals[_model.loopCount],
                              clearUnsetFields: false,
                              create: true,
                            ),
                            type: TaskType.Goal,
                            status: TaskStatus.incomplete,
                          ));
                          // creates a history item

                          await HistoryRecord.createDoc(currentUserReference!)
                              .set(createHistoryRecordData(
                            name: FFAppState().goals[_model.loopCount].name,
                            date: getCurrentTimestamp,
                            actionType: ActionTypes.completed,
                            actionAmount: _model.splitAmount - _model.overflow,
                            actionLocation: ActionLocations.Goals,
                          ));
                        } else {
                          // sets the progress
                          FFAppState().updateGoalsAtIndex(
                            _model.loopCount,
                            (e) => e
                              ..progress = (FFAppState()
                                      .goals[_model.loopCount]
                                      .addedAmount /
                                  FFAppState().goals[_model.loopCount].amount),
                          );
                          // creates a history item

                          await HistoryRecord.createDoc(currentUserReference!)
                              .set(createHistoryRecordData(
                            name: FFAppState().goals[_model.loopCount].name,
                            date: getCurrentTimestamp,
                            actionType: ActionTypes.add,
                            actionAmount: _model.splitAmount,
                            actionLocation: ActionLocations.Goals,
                          ));
                        }
                      }
                      // increments loop counter
                      _model.loopCount = _model.loopCount + 1;
                      _model.updatePage(() {});
                    }
                    // updates goals in user data on firebase

                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'goals': getGoalListFirestoreData(
                            FFAppState().goals,
                          ),
                        },
                      ),
                    });
                    Navigator.pop(context);
                  },
                  text: 'Confirm',
                  icon: const Icon(
                    Icons.check_rounded,
                    size: 20.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconAlignment: IconAlignment.start,
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(const SizedBox(width: 12.0)),
            ),
            Flexible(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Builder(
                      builder: (context) {
                        final goalsForSplit =
                            (currentUserDocument?.goals.toList() ?? [])
                                .where((e) => e.progress != FFAppConstants.one)
                                .toList();

                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: goalsForSplit.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                          itemBuilder: (context, goalsForSplitIndex) {
                            final goalsForSplitItem =
                                goalsForSplit[goalsForSplitIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: Color(0x23000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            goalsForSplitItem.name,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              formatNumber(
                                                goalsForSplitItem.amount,
                                                formatType: FormatType.compact,
                                                currency: '',
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '+',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              TextSpan(
                                                text: formatNumber(
                                                  _model.splitAmount,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.periodDecimal,
                                                  currency: '',
                                                ),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          LinearPercentIndicator(
                                            percent: goalsForSplitItem.progress,
                                            width: 100.0,
                                            lineHeight: 15.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: const Color(0xFF4B39EF),
                                            backgroundColor: const Color(0x4C4B39EF),
                                            padding: EdgeInsets.zero,
                                          ),
                                          Text(
                                            formatNumber(
                                              goalsForSplitItem.addedAmount,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                              currency: '\$',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
