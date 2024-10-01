import '/components/goal_card_widget.dart';
import '/components/universal_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'goal_page_template_widget.dart' show GoalPageTemplateWidget;
import 'package:flutter/material.dart';

class GoalPageTemplateModel extends FlutterFlowModel<GoalPageTemplateWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for GoalCard component.
  late GoalCardModel goalCardModel;
  // Model for UniversalNavBar component.
  late UniversalNavBarModel universalNavBarModel;

  @override
  void initState(BuildContext context) {
    goalCardModel = createModel(context, () => GoalCardModel());
    universalNavBarModel = createModel(context, () => UniversalNavBarModel());
  }

  @override
  void dispose() {
    goalCardModel.dispose();
    universalNavBarModel.dispose();
  }
}
