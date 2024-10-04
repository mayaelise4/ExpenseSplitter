import '/components/money_info_card_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bill_page_widget.dart' show BillPageWidget;
import 'package:flutter/material.dart';

class BillPageModel extends FlutterFlowModel<BillPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MoneyInfoCard component.
  late MoneyInfoCardModel moneyInfoCardModel1;
  // Model for MoneyInfoCard component.
  late MoneyInfoCardModel moneyInfoCardModel2;
  // Model for MoneyInfoCard component.
  late MoneyInfoCardModel moneyInfoCardModel3;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    moneyInfoCardModel1 = createModel(context, () => MoneyInfoCardModel());
    moneyInfoCardModel2 = createModel(context, () => MoneyInfoCardModel());
    moneyInfoCardModel3 = createModel(context, () => MoneyInfoCardModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    moneyInfoCardModel1.dispose();
    moneyInfoCardModel2.dispose();
    moneyInfoCardModel3.dispose();
    navBarModel.dispose();
  }
}
