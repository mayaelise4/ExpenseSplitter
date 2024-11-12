import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "goal" field.
  GoalStruct? _goal;
  GoalStruct get goal => _goal ?? GoalStruct();
  bool hasGoal() => _goal != null;

  // "status" field.
  TaskStatus? _status;
  TaskStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "type" field.
  TaskType? _type;
  TaskType? get type => _type;
  bool hasType() => _type != null;

  // "bill" field.
  BillStruct? _bill;
  BillStruct get bill => _bill ?? BillStruct();
  bool hasBill() => _bill != null;

  // "income" field.
  IncomeStruct? _income;
  IncomeStruct get income => _income ?? IncomeStruct();
  bool hasIncome() => _income != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _tag = snapshotData['tag'] as String?;
    _goal = GoalStruct.maybeFromMap(snapshotData['goal']);
    _status = deserializeEnum<TaskStatus>(snapshotData['status']);
    _type = deserializeEnum<TaskType>(snapshotData['type']);
    _bill = BillStruct.maybeFromMap(snapshotData['bill']);
    _income = IncomeStruct.maybeFromMap(snapshotData['income']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tasks')
          : FirebaseFirestore.instance.collectionGroup('tasks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tasks').doc(id);

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  DateTime? date,
  String? tag,
  GoalStruct? goal,
  TaskStatus? status,
  TaskType? type,
  BillStruct? bill,
  IncomeStruct? income,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'tag': tag,
      'goal': GoalStruct().toMap(),
      'status': status,
      'type': type,
      'bill': BillStruct().toMap(),
      'income': IncomeStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "goal" field.
  addGoalStructData(firestoreData, goal, 'goal');

  // Handle nested data for "bill" field.
  addBillStructData(firestoreData, bill, 'bill');

  // Handle nested data for "income" field.
  addIncomeStructData(firestoreData, income, 'income');

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.tag == e2?.tag &&
        e1?.goal == e2?.goal &&
        e1?.status == e2?.status &&
        e1?.type == e2?.type &&
        e1?.bill == e2?.bill &&
        e1?.income == e2?.income;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality()
      .hash([e?.date, e?.tag, e?.goal, e?.status, e?.type, e?.bill, e?.income]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
