// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HistoryStruct extends FFFirebaseStruct {
  HistoryStruct({
    String? actionItem,
    DateTime? actionDate,
    ActionTypes? actionType,
    double? actionAmount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _actionItem = actionItem,
        _actionDate = actionDate,
        _actionType = actionType,
        _actionAmount = actionAmount,
        super(firestoreUtilData);

  // "actionItem" field.
  String? _actionItem;
  String get actionItem => _actionItem ?? '';
  set actionItem(String? val) => _actionItem = val;

  bool hasActionItem() => _actionItem != null;

  // "actionDate" field.
  DateTime? _actionDate;
  DateTime? get actionDate => _actionDate;
  set actionDate(DateTime? val) => _actionDate = val;

  bool hasActionDate() => _actionDate != null;

  // "actionType" field.
  ActionTypes? _actionType;
  ActionTypes? get actionType => _actionType;
  set actionType(ActionTypes? val) => _actionType = val;

  bool hasActionType() => _actionType != null;

  // "actionAmount" field.
  double? _actionAmount;
  double get actionAmount => _actionAmount ?? 0.0;
  set actionAmount(double? val) => _actionAmount = val;

  void incrementActionAmount(double amount) =>
      actionAmount = actionAmount + amount;

  bool hasActionAmount() => _actionAmount != null;

  static HistoryStruct fromMap(Map<String, dynamic> data) => HistoryStruct(
        actionItem: data['actionItem'] as String?,
        actionDate: data['actionDate'] as DateTime?,
        actionType: deserializeEnum<ActionTypes>(data['actionType']),
        actionAmount: castToType<double>(data['actionAmount']),
      );

  static HistoryStruct? maybeFromMap(dynamic data) =>
      data is Map ? HistoryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'actionItem': _actionItem,
        'actionDate': _actionDate,
        'actionType': _actionType?.serialize(),
        'actionAmount': _actionAmount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'actionItem': serializeParam(
          _actionItem,
          ParamType.String,
        ),
        'actionDate': serializeParam(
          _actionDate,
          ParamType.DateTime,
        ),
        'actionType': serializeParam(
          _actionType,
          ParamType.Enum,
        ),
        'actionAmount': serializeParam(
          _actionAmount,
          ParamType.double,
        ),
      }.withoutNulls;

  static HistoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      HistoryStruct(
        actionItem: deserializeParam(
          data['actionItem'],
          ParamType.String,
          false,
        ),
        actionDate: deserializeParam(
          data['actionDate'],
          ParamType.DateTime,
          false,
        ),
        actionType: deserializeParam<ActionTypes>(
          data['actionType'],
          ParamType.Enum,
          false,
        ),
        actionAmount: deserializeParam(
          data['actionAmount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'HistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HistoryStruct &&
        actionItem == other.actionItem &&
        actionDate == other.actionDate &&
        actionType == other.actionType &&
        actionAmount == other.actionAmount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([actionItem, actionDate, actionType, actionAmount]);
}

HistoryStruct createHistoryStruct({
  String? actionItem,
  DateTime? actionDate,
  ActionTypes? actionType,
  double? actionAmount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HistoryStruct(
      actionItem: actionItem,
      actionDate: actionDate,
      actionType: actionType,
      actionAmount: actionAmount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HistoryStruct? updateHistoryStruct(
  HistoryStruct? history, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    history
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHistoryStructData(
  Map<String, dynamic> firestoreData,
  HistoryStruct? history,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (history == null) {
    return;
  }
  if (history.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && history.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final historyData = getHistoryFirestoreData(history, forFieldValue);
  final nestedData = historyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = history.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHistoryFirestoreData(
  HistoryStruct? history, [
  bool forFieldValue = false,
]) {
  if (history == null) {
    return {};
  }
  final firestoreData = mapToFirestore(history.toMap());

  // Add any Firestore field values
  history.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHistoryListFirestoreData(
  List<HistoryStruct>? historys,
) =>
    historys?.map((e) => getHistoryFirestoreData(e, true)).toList() ?? [];
