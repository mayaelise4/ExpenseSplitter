import '/flutter_flow/flutter_flow_util.dart';
import 'input_transaction_widget.dart' show InputTransactionWidget;
import 'package:flutter/material.dart';

class InputTransactionModel extends FlutterFlowModel<InputTransactionWidget> {
  ///  Local state fields for this component.

  String? name;

  double amount = 0.0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
