import '/components/money_info_card_widget.dart';
import '/components/universal_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bill_page_template_widget.dart' show BillPageTemplateWidget;
import 'package:flutter/material.dart';

class BillPageTemplateModel extends FlutterFlowModel<BillPageTemplateWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MoneyInfoCard component.
  late MoneyInfoCardModel moneyInfoCardModel1;
  // Model for MoneyInfoCard component.
  late MoneyInfoCardModel moneyInfoCardModel2;
  // Model for MoneyInfoCard component.
  late MoneyInfoCardModel moneyInfoCardModel3;
  // Model for UniversalNavBar component.
  late UniversalNavBarModel universalNavBarModel;

  @override
  void initState(BuildContext context) {
    moneyInfoCardModel1 = createModel(context, () => MoneyInfoCardModel());
    moneyInfoCardModel2 = createModel(context, () => MoneyInfoCardModel());
    moneyInfoCardModel3 = createModel(context, () => MoneyInfoCardModel());
    universalNavBarModel = createModel(context, () => UniversalNavBarModel());
  }

  @override
  void dispose() {
    moneyInfoCardModel1.dispose();
    moneyInfoCardModel2.dispose();
    moneyInfoCardModel3.dispose();
    universalNavBarModel.dispose();
  }
}
