import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future updateAppStateOnLogout(BuildContext context) async {
  // add any field that needs to be cleared upon logging out here
  FFAppState().deleteTransactions();
  FFAppState().Transactions = [];

  FFAppState().deletePocketAmount();
  FFAppState().pocketAmount = 0.0;

  FFAppState().update(() {});
}

Future updateAppStateOnLogIn(BuildContext context) async {
  // will fill the app state information with data from firebase when this component is loaded
  FFAppState().pocketAmount =
      valueOrDefault(currentUserDocument?.pocketAmount, 0.0);
  FFAppState().Transactions =
      (currentUserDocument?.transactions.toList() ?? [])
          .toList()
          .cast<TransactionStruct>();
  FFAppState().update(() {});
}
