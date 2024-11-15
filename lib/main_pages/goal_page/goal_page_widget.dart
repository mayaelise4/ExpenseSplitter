import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/confirm_action/confirm_action_widget.dart';
import '/components/inputs/input_goal/input_goal_widget.dart';
import '/components/list_items/empty_list_display/empty_list_display_widget.dart';
import '/components/list_items/goal_card/goal_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'goal_page_model.dart';
export 'goal_page_model.dart';

class GoalPageWidget extends StatefulWidget {
  const GoalPageWidget({super.key});

  @override
  State<GoalPageWidget> createState() => _GoalPageWidgetState();
}

class _GoalPageWidgetState extends State<GoalPageWidget> {
  late GoalPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8),
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
        )
            ? AppBar(
                backgroundColor: const Color(0xFF4B39EF),
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                title: Text(
                  'Goals',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: const AlignmentDirectional(-0.5, 0.0),
                        image: Image.network(
                          'https://images.unsplash.com/photo-1621862623900-832ef4dd24aa?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxzaWx2ZXIlMjBjb2luc3xlbnwwfHx8fDE3MjkyMDA0NjF8MA&ixlib=rb-4.0.3&q=80&w=1080',
                        ).image,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final goalList = FFAppState().goals.toList();
                              if (goalList.isEmpty) {
                                return const Center(
                                  child: EmptyListDisplayWidget(
                                    itemName: 'Goals',
                                  ),
                                );
                              }

                              return ListView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  150.0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: goalList.length,
                                itemBuilder: (context, goalListIndex) {
                                  final goalListItem = goalList[goalListIndex];
                                  return wrapWithModel(
                                    model: _model.goalCardModels.getModel(
                                      goalListIndex.toString(),
                                      goalListIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: GoalCardWidget(
                                      key: Key(
                                        'Key7lc_${goalListIndex.toString()}',
                                      ),
                                      goalName: goalListItem.name,
                                      goalDesc: goalListItem.description,
                                      goalAmount: goalListItem.amount,
                                      goalProgress: goalListItem.progress,
                                      index: goalListIndex,
                                      added: goalListItem.addedAmount,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      wrapWithModel(
                        model: _model.navBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavBarWidget(
                          whichInput: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const SizedBox(
                                      height: 500.0,
                                      child: InputGoalWidget(),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 100.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.loopCount = FFAppState().goals.length - 1;
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const ConfirmActionWidget(),
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.confirm = value));

                          if (_model.confirm!) {
                            while (FFAppConstants.zero <=
                                _model.loopCount.toDouble()) {
                              if (FFAppState()
                                      .goals[_model.loopCount]
                                      .progress ==
                                  FFAppConstants.one) {
                                await HistoryRecord.createDoc(
                                        currentUserReference!)
                                    .set(createHistoryRecordData(
                                  name:
                                      FFAppState().goals[_model.loopCount].name,
                                  date: getCurrentTimestamp,
                                  actionType: ActionTypes.delete,
                                  actionAmount: FFAppState()
                                      .goals[_model.loopCount]
                                      .amount,
                                  actionLocation: ActionLocations.Goals,
                                ));
                                FFAppState()
                                    .removeAtIndexFromGoals(_model.loopCount);
                              }
                              _model.loopCount = _model.loopCount + -1;
                              safeSetState(() {});
                            }

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'goals': getGoalListFirestoreData(
                                    FFAppState().goals,
                                  ),
                                },
                              ),
                            });
                          }

                          safeSetState(() {});
                        },
                        text: 'Clear Complete',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
