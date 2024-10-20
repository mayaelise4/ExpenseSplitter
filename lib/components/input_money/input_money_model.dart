import '/flutter_flow/flutter_flow_util.dart';
import 'input_money_widget.dart' show InputMoneyWidget;
import 'package:flutter/material.dart';

class InputMoneyModel extends FlutterFlowModel<InputMoneyWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
