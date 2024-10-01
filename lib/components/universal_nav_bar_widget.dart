import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'universal_nav_bar_model.dart';
export 'universal_nav_bar_model.dart';

class UniversalNavBarWidget extends StatefulWidget {
  /// bottom menu bar
  const UniversalNavBarWidget({super.key});

  @override
  State<UniversalNavBarWidget> createState() => _UniversalNavBarWidgetState();
}

class _UniversalNavBarWidgetState extends State<UniversalNavBarWidget> {
  late UniversalNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UniversalNavBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            wrapWithModel(
              model: _model.navBar1Model,
              updateCallback: () => safeSetState(() {}),
              child: const NavBar1Widget(),
            ),
          ],
        ),
      ],
    );
  }
}
