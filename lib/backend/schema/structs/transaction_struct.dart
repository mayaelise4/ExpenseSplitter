// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TransactionStruct extends FFFirebaseStruct {
  TransactionStruct({
    String? name,
    String? date,
    double? amount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _date = date,
        _amount = amount,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? 'Name';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '10/3';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.00;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  static TransactionStruct fromMap(Map<String, dynamic> data) =>
      TransactionStruct(
        name: data['name'] as String?,
        date: data['date'] as String?,
        amount: castToType<double>(data['amount']),
      );

  static TransactionStruct? maybeFromMap(dynamic data) => data is Map
      ? TransactionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'date': _date,
        'amount': _amount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
      }.withoutNulls;

  static TransactionStruct fromSerializableMap(Map<String, dynamic> data) =>
      TransactionStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'TransactionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransactionStruct &&
        name == other.name &&
        date == other.date &&
        amount == other.amount;
  }

  @override
  int get hashCode => const ListEquality().hash([name, date, amount]);
}

TransactionStruct createTransactionStruct({
  String? name,
  String? date,
  double? amount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TransactionStruct(
      name: name,
      date: date,
      amount: amount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TransactionStruct? updateTransactionStruct(
  TransactionStruct? transaction, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    transaction
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTransactionStructData(
  Map<String, dynamic> firestoreData,
  TransactionStruct? transaction,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (transaction == null) {
    return;
  }
  if (transaction.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && transaction.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final transactionData =
      getTransactionFirestoreData(transaction, forFieldValue);
  final nestedData =
      transactionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = transaction.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTransactionFirestoreData(
  TransactionStruct? transaction, [
  bool forFieldValue = false,
]) {
  if (transaction == null) {
    return {};
  }
  final firestoreData = mapToFirestore(transaction.toMap());

  // Add any Firestore field values
  transaction.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTransactionListFirestoreData(
  List<TransactionStruct>? transactions,
) =>
    transactions?.map((e) => getTransactionFirestoreData(e, true)).toList() ??
    [];
