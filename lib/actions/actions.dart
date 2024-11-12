import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future updateAppStateOnLogout(BuildContext context) async {
  // add any field that needs to be cleared upon logging out here
  FFAppState().deleteTransactions();
  FFAppState().Transactions = [];

  FFAppState().deleteBills();
  FFAppState().bills = [];

  FFAppState().deleteGoals();
  FFAppState().goals = [];

  FFAppState().deleteTotalSpending();
  FFAppState().totalSpending = 0.0;

  FFAppState().deleteIncome();
  FFAppState().income = [];

  FFAppState().deleteIncompleteTaskExists();
  FFAppState().incompleteTaskExists = false;

  FFAppState().update(() {});
}

Future updateAppStateOnLogIn(BuildContext context) async {
  // will fill the app state information with data from firebase when this component is loaded
  FFAppState().Transactions =
      (currentUserDocument?.transactions.toList() ?? [])
          .toList()
          .cast<TransactionStruct>();
  FFAppState().bills = (currentUserDocument?.bills.toList() ?? [])
      .sortedList(keyOf: (e) => e.dueDate, desc: false)
      .toList()
      .cast<BillStruct>();
  FFAppState().goals =
      (currentUserDocument?.goals.toList() ?? []).toList().cast<GoalStruct>();
  FFAppState().income = (currentUserDocument?.incomes.toList() ?? [])
      .sortedList(keyOf: (e) => e.payDate, desc: false)
      .toList()
      .cast<IncomeStruct>();
  FFAppState().update(() {});
}
