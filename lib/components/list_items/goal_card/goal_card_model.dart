import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/confirm_action/confirm_action_widget.dart';
import '/components/inputs/add_to_goal/add_to_goal_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'goal_card_widget.dart' show GoalCardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class GoalCardModel extends FlutterFlowModel<GoalCardWidget> {
  ///  Local state fields for this component.

  double progress = 0.0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - confirmAction] action in IconButton widget.
  bool? confirm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
