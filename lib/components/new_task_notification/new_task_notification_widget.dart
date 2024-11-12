import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'new_task_notification_model.dart';
export 'new_task_notification_model.dart';

class NewTaskNotificationWidget extends StatefulWidget {
  /// set to show when there is an incomplete task
  const NewTaskNotificationWidget({super.key});

  @override
  State<NewTaskNotificationWidget> createState() =>
      _NewTaskNotificationWidgetState();
}

class _NewTaskNotificationWidgetState extends State<NewTaskNotificationWidget> {
  late NewTaskNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewTaskNotificationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: FFAppState().incompleteTaskExists,
      child: Icon(
        Icons.notifications_active_outlined,
        color: FlutterFlowTheme.of(context).secondary,
        size: 30.0,
      ),
    );
  }
}
