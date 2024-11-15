import '/components/list_items/goal_card/goal_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'goal_page_widget.dart' show GoalPageWidget;
import 'package:flutter/material.dart';

class GoalPageModel extends FlutterFlowModel<GoalPageWidget> {
  ///  Local state fields for this page.

  int loopCount = 0;

  ///  State fields for stateful widgets in this page.

  // Models for GoalCard dynamic component.
  late FlutterFlowDynamicModels<GoalCardModel> goalCardModels;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Stores action output result for [Bottom Sheet - confirmAction] action in Clear widget.
  bool? confirm;

  @override
  void initState(BuildContext context) {
    goalCardModels = FlutterFlowDynamicModels(() => GoalCardModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    goalCardModels.dispose();
    navBarModel.dispose();
  }
}
