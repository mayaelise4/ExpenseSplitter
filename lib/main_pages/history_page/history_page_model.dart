import '/components/list_items/history_card/history_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'history_page_widget.dart' show HistoryPageWidget;
import 'package:flutter/material.dart';

class HistoryPageModel extends FlutterFlowModel<HistoryPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for HistoryCard dynamic component.
  late FlutterFlowDynamicModels<HistoryCardModel> historyCardModels;

  @override
  void initState(BuildContext context) {
    historyCardModels = FlutterFlowDynamicModels(() => HistoryCardModel());
  }

  @override
  void dispose() {
    historyCardModels.dispose();
  }
}
