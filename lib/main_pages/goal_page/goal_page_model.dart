import '/components/goal_card_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'goal_page_widget.dart' show GoalPageWidget;
import 'package:flutter/material.dart';

class GoalPageModel extends FlutterFlowModel<GoalPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for GoalCard component.
  late GoalCardModel goalCardModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    goalCardModel = createModel(context, () => GoalCardModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    goalCardModel.dispose();
    navBarModel.dispose();
  }
}
