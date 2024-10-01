import '/components/universal_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'spending_page_template_widget.dart' show SpendingPageTemplateWidget;
import 'package:flutter/material.dart';

class SpendingPageTemplateModel
    extends FlutterFlowModel<SpendingPageTemplateWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UniversalNavBar component.
  late UniversalNavBarModel universalNavBarModel;

  @override
  void initState(BuildContext context) {
    universalNavBarModel = createModel(context, () => UniversalNavBarModel());
  }

  @override
  void dispose() {
    universalNavBarModel.dispose();
  }
}
