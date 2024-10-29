// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class IncomeStruct extends FFFirebaseStruct {
  IncomeStruct({
    String? name,
    double? amount,
    DateTime? payDate,
    String? freq,
    DateTime? actionDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _amount = amount,
        _payDate = payDate,
        _freq = freq,
        _actionDate = actionDate,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? 'incomeName';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "payDate" field.
  DateTime? _payDate;
  DateTime get payDate =>
      _payDate ?? DateTime.fromMicrosecondsSinceEpoch(1730091600000000);
  set payDate(DateTime? val) => _payDate = val;

  bool hasPayDate() => _payDate != null;

  // "freq" field.
  String? _freq;
  String get freq => _freq ?? 'Monthly';
  set freq(String? val) => _freq = val;

  bool hasFreq() => _freq != null;

  // "actionDate" field.
  DateTime? _actionDate;
  DateTime? get actionDate => _actionDate;
  set actionDate(DateTime? val) => _actionDate = val;

  bool hasActionDate() => _actionDate != null;

  static IncomeStruct fromMap(Map<String, dynamic> data) => IncomeStruct(
        name: data['name'] as String?,
        amount: castToType<double>(data['amount']),
        payDate: data['payDate'] as DateTime?,
        freq: data['freq'] as String?,
        actionDate: data['actionDate'] as DateTime?,
      );

  static IncomeStruct? maybeFromMap(dynamic data) =>
      data is Map ? IncomeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'amount': _amount,
        'payDate': _payDate,
        'freq': _freq,
        'actionDate': _actionDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'payDate': serializeParam(
          _payDate,
          ParamType.DateTime,
        ),
        'freq': serializeParam(
          _freq,
          ParamType.String,
        ),
        'actionDate': serializeParam(
          _actionDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static IncomeStruct fromSerializableMap(Map<String, dynamic> data) =>
      IncomeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        payDate: deserializeParam(
          data['payDate'],
          ParamType.DateTime,
          false,
        ),
        freq: deserializeParam(
          data['freq'],
          ParamType.String,
          false,
        ),
        actionDate: deserializeParam(
          data['actionDate'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'IncomeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IncomeStruct &&
        name == other.name &&
        amount == other.amount &&
        payDate == other.payDate &&
        freq == other.freq &&
        actionDate == other.actionDate;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, amount, payDate, freq, actionDate]);
}

IncomeStruct createIncomeStruct({
  String? name,
  double? amount,
  DateTime? payDate,
  String? freq,
  DateTime? actionDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IncomeStruct(
      name: name,
      amount: amount,
      payDate: payDate,
      freq: freq,
      actionDate: actionDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IncomeStruct? updateIncomeStruct(
  IncomeStruct? income, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    income
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIncomeStructData(
  Map<String, dynamic> firestoreData,
  IncomeStruct? income,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (income == null) {
    return;
  }
  if (income.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && income.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final incomeData = getIncomeFirestoreData(income, forFieldValue);
  final nestedData = incomeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = income.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIncomeFirestoreData(
  IncomeStruct? income, [
  bool forFieldValue = false,
]) {
  if (income == null) {
    return {};
  }
  final firestoreData = mapToFirestore(income.toMap());

  // Add any Firestore field values
  income.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIncomeListFirestoreData(
  List<IncomeStruct>? incomes,
) =>
    incomes?.map((e) => getIncomeFirestoreData(e, true)).toList() ?? [];
