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
