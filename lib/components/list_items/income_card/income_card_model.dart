import '/backend/schema/structs/index.dart';
import '/components/confirm_action/confirm_action_widget.dart';
import '/components/inputs/edit_bill/edit_bill_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'income_card_widget.dart' show IncomeCardWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IncomeCardModel extends FlutterFlowModel<IncomeCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - confirmAction] action in IconButton widget.
  bool? confirm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
