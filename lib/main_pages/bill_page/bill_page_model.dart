import '/components/list_items/bill_card/bill_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bill_page_widget.dart' show BillPageWidget;
import 'package:flutter/material.dart';

class BillPageModel extends FlutterFlowModel<BillPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for BillCard dynamic component.
  late FlutterFlowDynamicModels<BillCardModel> billCardModels;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    billCardModels = FlutterFlowDynamicModels(() => BillCardModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    billCardModels.dispose();
    navBarModel.dispose();
  }
}
