import '/flutter_flow/flutter_flow_util.dart';
import 'add_to_goal_widget.dart' show AddToGoalWidget;
import 'package:flutter/material.dart';

class AddToGoalModel extends FlutterFlowModel<AddToGoalWidget> {
  ///  Local state fields for this component.

  String name = 'goal';

  double amount = 0.0;

  double progress = 0.0;

  String? description;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'an amount is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    amountTextControllerValidator = _amountTextControllerValidator;
  }

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
