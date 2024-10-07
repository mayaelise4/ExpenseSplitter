// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BillStruct extends FFFirebaseStruct {
  BillStruct({
    String? name,
    double? amount,
    DateTime? time,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _amount = amount,
        _time = time,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? 'billName';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "time" field.
  DateTime? _time;
  DateTime get time =>
      _time ?? DateTime.fromMicrosecondsSinceEpoch(1728104400000000);
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  static BillStruct fromMap(Map<String, dynamic> data) => BillStruct(
        name: data['name'] as String?,
        amount: castToType<double>(data['amount']),
        time: data['time'] as DateTime?,
      );

  static BillStruct? maybeFromMap(dynamic data) =>
      data is Map ? BillStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'amount': _amount,
        'time': _time,
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
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static BillStruct fromSerializableMap(Map<String, dynamic> data) =>
      BillStruct(
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
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'BillStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BillStruct &&
        name == other.name &&
        amount == other.amount &&
        time == other.time;
  }

  @override
  int get hashCode => const ListEquality().hash([name, amount, time]);
}

BillStruct createBillStruct({
  String? name,
  double? amount,
  DateTime? time,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BillStruct(
      name: name,
      amount: amount,
      time: time,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BillStruct? updateBillStruct(
  BillStruct? bill, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bill
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBillStructData(
  Map<String, dynamic> firestoreData,
  BillStruct? bill,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bill == null) {
    return;
  }
  if (bill.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && bill.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final billData = getBillFirestoreData(bill, forFieldValue);
  final nestedData = billData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bill.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBillFirestoreData(
  BillStruct? bill, [
  bool forFieldValue = false,
]) {
  if (bill == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bill.toMap());

  // Add any Firestore field values
  bill.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBillListFirestoreData(
  List<BillStruct>? bills,
) =>
    bills?.map((e) => getBillFirestoreData(e, true)).toList() ?? [];
