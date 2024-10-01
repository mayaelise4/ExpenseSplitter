import '/components/universal_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pocket_page_widget.dart' show PocketPageWidget;
import 'package:flutter/material.dart';

class PocketPageModel extends FlutterFlowModel<PocketPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
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
