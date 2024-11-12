import '/components/list_items/income_card/income_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'income_page_widget.dart' show IncomePageWidget;
import 'package:flutter/material.dart';

class IncomePageModel extends FlutterFlowModel<IncomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for IncomeCard dynamic component.
  late FlutterFlowDynamicModels<IncomeCardModel> incomeCardModels;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    incomeCardModels = FlutterFlowDynamicModels(() => IncomeCardModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    incomeCardModels.dispose();
    navBarModel.dispose();
  }
}
