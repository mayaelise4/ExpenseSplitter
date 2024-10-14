// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PocketInputStruct extends FFFirebaseStruct {
  PocketInputStruct({
    double? amount,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _amount = amount,
        _date = date,
        super(firestoreUtilData);

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "date" field.
  DateTime? _date;
  DateTime get date =>
      _date ?? DateTime.fromMicrosecondsSinceEpoch(1728795600000000);
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static PocketInputStruct fromMap(Map<String, dynamic> data) =>
      PocketInputStruct(
        amount: castToType<double>(data['amount']),
        date: data['date'] as DateTime?,
      );

  static PocketInputStruct? maybeFromMap(dynamic data) => data is Map
      ? PocketInputStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'amount': _amount,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static PocketInputStruct fromSerializableMap(Map<String, dynamic> data) =>
      PocketInputStruct(
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'PocketInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PocketInputStruct &&
        amount == other.amount &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([amount, date]);
}

PocketInputStruct createPocketInputStruct({
  double? amount,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PocketInputStruct(
      amount: amount,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PocketInputStruct? updatePocketInputStruct(
  PocketInputStruct? pocketInput, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pocketInput
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPocketInputStructData(
  Map<String, dynamic> firestoreData,
  PocketInputStruct? pocketInput,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pocketInput == null) {
    return;
  }
  if (pocketInput.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pocketInput.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pocketInputData =
      getPocketInputFirestoreData(pocketInput, forFieldValue);
  final nestedData =
      pocketInputData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pocketInput.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPocketInputFirestoreData(
  PocketInputStruct? pocketInput, [
  bool forFieldValue = false,
]) {
  if (pocketInput == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pocketInput.toMap());

  // Add any Firestore field values
  pocketInput.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPocketInputListFirestoreData(
  List<PocketInputStruct>? pocketInputs,
) =>
    pocketInputs?.map((e) => getPocketInputFirestoreData(e, true)).toList() ??
    [];
