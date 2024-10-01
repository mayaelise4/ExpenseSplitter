import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'universal_nav_bar_widget.dart' show UniversalNavBarWidget;
import 'package:flutter/material.dart';

class UniversalNavBarModel extends FlutterFlowModel<UniversalNavBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    navBar1Model.dispose();
  }
}
