import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double? sumTransactions(List<TransactionStruct>? list) {
  // I want the function to return a sum of all the amounts in the list of transactions and return 0 if the list is empty.
  if (list == null || list.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  for (var transaction in list) {
    sum += transaction.amount;
  }

  return sum;
}

double calculatePocket(
  double sum,
  double spending,
) {
  return sum - spending;
}

DateTime moveBillDate(
  DateTime date,
  String freq,
) {
  if (freq == BillTypes.biWeekly.toString().split('.').last)
    date = DateTime(date.year, date.month, date.day + 14);
  else if (freq == BillTypes.Monthly.toString().split('.').last)
    date = DateTime(date.year, date.month + 1, date.day);
  else if (freq == BillTypes.Quarterly.toString().split('.').last)
    date = DateTime(date.year, date.month + 3, date.day);
  else if (freq == BillTypes.SemiAnnually.toString().split('.').last)
    date = DateTime(date.year, date.month + 6, date.day);
  else
    date = DateTime(date.year + 1, date.month, date.day);
  return date;
}

bool checkForIncompleteTask(List<TasksRecord> tasks) {
  for (var doc in tasks) {
    if (doc.type == TaskStatus.incomplete) return true;
  }
  return false;
}

DateTime moveIncomeDate(
  DateTime date,
  String freq,
) {
  if (freq == IncomeTypes.biWeekly.toString().split('.').last) {
    date = date.add(Duration(days: 14));
  } else if (freq == IncomeTypes.Monthly.toString().split('.').last) {
    date = DateTime(date.year, date.month + 1, date.day);
  } else if (freq == IncomeTypes.Quarterly.toString().split('.').last) {
    date = DateTime(date.year, date.month + 3, date.day);
  } else if (freq == IncomeTypes.SemiAnnually.toString().split('.').last) {
    date = DateTime(date.year, date.month + 6, date.day);
  } else {
    date = DateTime(date.year + 1, date.month, date.day);
  }
  return date;
}
