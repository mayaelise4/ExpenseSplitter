import '/flutter_flow/flutter_flow_util.dart';
import 'edu_page_widget.dart' show EduPageWidget;
import 'package:flutter/material.dart';

class EduPageModel extends FlutterFlowModel<EduPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in AskAction widget.
  String? geminiresponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questionFocusNode?.dispose();
    questionTextController?.dispose();
  }

  /// Action blocks.
  Future save(BuildContext context) async {
    Navigator.pop(context);
  }
}
