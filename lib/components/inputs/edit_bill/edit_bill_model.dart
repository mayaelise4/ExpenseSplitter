import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_bill_widget.dart' show EditBillWidget;
import 'package:flutter/material.dart';

class EditBillModel extends FlutterFlowModel<EditBillWidget> {
  ///  Local state fields for this component.

  String frequency = 'Monthly';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for BillName widget.
  FocusNode? billNameFocusNode;
  TextEditingController? billNameTextController;
  String? Function(BuildContext, String?)? billNameTextControllerValidator;
  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    amountTextControllerValidator = _amountTextControllerValidator;
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    billNameFocusNode?.dispose();
    billNameTextController?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
