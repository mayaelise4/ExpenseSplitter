// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GoalStruct extends FFFirebaseStruct {
  GoalStruct({
    String? name,
    double? amount,
    String? description,
    double? progress,
    double? addedAmount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _amount = amount,
        _description = description,
        _progress = progress,
        _addedAmount = addedAmount,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? 'goalName';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "description" field.
  String? _description;
  String get description => _description ?? 'desc';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "progress" field.
  double? _progress;
  double get progress => _progress ?? 0.0;
  set progress(double? val) => _progress = val;

  void incrementProgress(double amount) => progress = progress + amount;

  bool hasProgress() => _progress != null;

  // "addedAmount" field.
  double? _addedAmount;
  double get addedAmount => _addedAmount ?? 0.0;
  set addedAmount(double? val) => _addedAmount = val;

  void incrementAddedAmount(double amount) =>
      addedAmount = addedAmount + amount;

  bool hasAddedAmount() => _addedAmount != null;

  static GoalStruct fromMap(Map<String, dynamic> data) => GoalStruct(
        name: data['name'] as String?,
        amount: castToType<double>(data['amount']),
        description: data['description'] as String?,
        progress: castToType<double>(data['progress']),
        addedAmount: castToType<double>(data['addedAmount']),
      );

  static GoalStruct? maybeFromMap(dynamic data) =>
      data is Map ? GoalStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'amount': _amount,
        'description': _description,
        'progress': _progress,
        'addedAmount': _addedAmount,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'progress': serializeParam(
          _progress,
          ParamType.double,
        ),
        'addedAmount': serializeParam(
          _addedAmount,
          ParamType.double,
        ),
      }.withoutNulls;

  static GoalStruct fromSerializableMap(Map<String, dynamic> data) =>
      GoalStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        progress: deserializeParam(
          data['progress'],
          ParamType.double,
          false,
        ),
        addedAmount: deserializeParam(
          data['addedAmount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'GoalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoalStruct &&
        name == other.name &&
        amount == other.amount &&
        description == other.description &&
        progress == other.progress &&
        addedAmount == other.addedAmount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, amount, description, progress, addedAmount]);
}

GoalStruct createGoalStruct({
  String? name,
  double? amount,
  String? description,
  double? progress,
  double? addedAmount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GoalStruct(
      name: name,
      amount: amount,
      description: description,
      progress: progress,
      addedAmount: addedAmount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GoalStruct? updateGoalStruct(
  GoalStruct? goal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    goal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGoalStructData(
  Map<String, dynamic> firestoreData,
  GoalStruct? goal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (goal == null) {
    return;
  }
  if (goal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && goal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final goalData = getGoalFirestoreData(goal, forFieldValue);
  final nestedData = goalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = goal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGoalFirestoreData(
  GoalStruct? goal, [
  bool forFieldValue = false,
]) {
  if (goal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(goal.toMap());

  // Add any Firestore field values
  goal.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGoalListFirestoreData(
  List<GoalStruct>? goals,
) =>
    goals?.map((e) => getGoalFirestoreData(e, true)).toList() ?? [];
