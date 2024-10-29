import '/components/list_items/transaction/transaction_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'spending_page_widget.dart' show SpendingPageWidget;
import 'package:flutter/material.dart';

class SpendingPageModel extends FlutterFlowModel<SpendingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for transaction dynamic component.
  late FlutterFlowDynamicModels<TransactionModel> transactionModels;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    transactionModels = FlutterFlowDynamicModels(() => TransactionModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    transactionModels.dispose();
    navBarModel.dispose();
  }
}
