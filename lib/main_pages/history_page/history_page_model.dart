import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'history_page_widget.dart' show HistoryPageWidget;
import 'package:flutter/material.dart';

class HistoryPageModel extends FlutterFlowModel<HistoryPageWidget> {
  ///  Local state fields for this page.

  ActionLocations? historyFilter = ActionLocations.Spending;

  ActionLocations? deletingFilter = ActionLocations.Spending;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - confirmAction] action in Clear widget.
  bool? confirm;
  // Stores action output result for [Firestore Query - Query a collection] action in Clear widget.
  List<HistoryRecord>? historyItems;
  // Stores action output result for [Firestore Query - Query a collection] action in Clear widget.
  HistoryRecord? docFiltered;
  // Stores action output result for [Firestore Query - Query a collection] action in Clear widget.
  HistoryRecord? docUnfilterd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
