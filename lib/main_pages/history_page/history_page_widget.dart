import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/confirm_action/confirm_action_widget.dart';
import '/components/list_items/empty_list_display/empty_list_display_widget.dart';
import '/components/list_items/history_card/history_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'history_page_model.dart';
export 'history_page_model.dart';

class HistoryPageWidget extends StatefulWidget {
  /// this page needs to list every action the user takes, and list some details
  /// here
  const HistoryPageWidget({super.key});

  @override
  State<HistoryPageWidget> createState() => _HistoryPageWidgetState();
}

class _HistoryPageWidgetState extends State<HistoryPageWidget> {
  late HistoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.historyFilter = null;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<HistoryRecord>>(
      stream: queryHistoryRecord(
        parent: currentUserReference,
      ),
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
        List<HistoryRecord> historyPageHistoryRecordList = snapshot.data!;

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
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'History',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 4.0, 0.0, 0.0),
                              child: Text(
                                'Below is the history of actions made by you \nFilter with the Buttons below',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final locationButtons =
                                      ActionLocations.values.toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:
                                          List.generate(locationButtons.length,
                                                  (locationButtonsIndex) {
                                        final locationButtonsItem =
                                            locationButtons[
                                                locationButtonsIndex];
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            if (locationButtonsItem ==
                                                _model.historyFilter) {
                                              _model.historyFilter = null;
                                              safeSetState(() {});
                                            } else {
                                              _model.historyFilter =
                                                  locationButtonsItem;
                                              safeSetState(() {});
                                            }
                                          },
                                          text: locationButtonsItem.name,
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    7.0, 0.0, 7.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.historyFilter ==
                                                    locationButtonsItem
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .accent1,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        );
                                      })
                                              .divide(const SizedBox(width: 5.0))
                                              .around(const SizedBox(width: 5.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                            if (_model.historyFilter != null)
                              Builder(
                                builder: (context) {
                                  final filteredHistoryList =
                                      historyPageHistoryRecordList
                                          .sortedList(
                                              keyOf: (e) => e.date!, desc: true)
                                          .where((e) =>
                                              (e.actionLocation ==
                                                  _model.historyFilter) &&
                                              (_model.historyFilter != null))
                                          .toList();
                                  if (filteredHistoryList.isEmpty) {
                                    return const EmptyListDisplayWidget(
                                      itemName: 'History',
                                    );
                                  }

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        filteredHistoryList.length,
                                        (filteredHistoryListIndex) {
                                      final filteredHistoryListItem =
                                          filteredHistoryList[
                                              filteredHistoryListIndex];
                                      return HistoryCardWidget(
                                        key: Key(
                                            'Keyvu0_${filteredHistoryListIndex}_of_${filteredHistoryList.length}'),
                                        historyDoc: filteredHistoryListItem,
                                      );
                                    }),
                                  );
                                },
                              ),
                            if (_model.historyFilter == null)
                              Builder(
                                builder: (context) {
                                  final historyList =
                                      historyPageHistoryRecordList
                                          .sortedList(
                                              keyOf: (e) => e.date!, desc: true)
                                          .toList();
                                  if (historyList.isEmpty) {
                                    return const EmptyListDisplayWidget(
                                      itemName: 'History',
                                    );
                                  }

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(historyList.length,
                                        (historyListIndex) {
                                      final historyListItem =
                                          historyList[historyListIndex];
                                      return HistoryCardWidget(
                                        key: Key(
                                            'Keyd5w_${historyListIndex}_of_${historyList.length}'),
                                        historyDoc: historyListItem,
                                      );
                                    }),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var shouldSetState = false;
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

                          shouldSetState = true;
                          if (_model.confirm!) {
                            _model.historyItems = await queryHistoryRecordOnce(
                              parent: currentUserReference,
                            );
                            shouldSetState = true;
                            if (_model.historyFilter != null) {
                              _model.deletingFilter = _model.historyFilter;
                              safeSetState(() {});
                              while (historyPageHistoryRecordList
                                      .where((e) =>
                                          e.actionLocation ==
                                          _model.historyFilter)
                                      .toList().isNotEmpty) {
                                _model.docFiltered =
                                    await queryHistoryRecordOnce(
                                  parent: currentUserReference,
                                  queryBuilder: (historyRecord) =>
                                      historyRecord.where(
                                    'actionLocation',
                                    isEqualTo:
                                        _model.deletingFilter?.serialize(),
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                shouldSetState = true;
                                await _model.docFiltered!.reference.delete();
                              }
                            } else {
                              while (historyPageHistoryRecordList
                                      .where((e) =>
                                          e.actionLocation ==
                                          _model.historyFilter)
                                      .toList().isNotEmpty) {
                                _model.docUnfilterd =
                                    await queryHistoryRecordOnce(
                                  parent: currentUserReference,
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                shouldSetState = true;
                                await _model.docFiltered!.reference.delete();
                              }
                            }
                          } else {
                            if (shouldSetState) safeSetState(() {});
                            return;
                          }

                          if (shouldSetState) safeSetState(() {});
                        },
                        text: 'Clear History',
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
            ),
          ),
        );
      },
    );
  }
}
