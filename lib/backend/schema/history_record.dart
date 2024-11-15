import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryRecord extends FirestoreRecord {
  HistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "actionType" field.
  ActionTypes? _actionType;
  ActionTypes? get actionType => _actionType;
  bool hasActionType() => _actionType != null;

  // "actionAmount" field.
  double? _actionAmount;
  double get actionAmount => _actionAmount ?? 0.0;
  bool hasActionAmount() => _actionAmount != null;

  // "actionLocation" field.
  ActionLocations? _actionLocation;
  ActionLocations? get actionLocation => _actionLocation;
  bool hasActionLocation() => _actionLocation != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _actionType = deserializeEnum<ActionTypes>(snapshotData['actionType']);
    _actionAmount = castToType<double>(snapshotData['actionAmount']);
    _actionLocation =
        deserializeEnum<ActionLocations>(snapshotData['actionLocation']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('history')
          : FirebaseFirestore.instance.collectionGroup('history');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('history').doc(id);

  static Stream<HistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryRecord.fromSnapshot(s));

  static Future<HistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoryRecord.fromSnapshot(s));

  static HistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryRecordData({
  String? name,
  DateTime? date,
  ActionTypes? actionType,
  double? actionAmount,
  ActionLocations? actionLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'date': date,
      'actionType': actionType,
      'actionAmount': actionAmount,
      'actionLocation': actionLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoryRecordDocumentEquality implements Equality<HistoryRecord> {
  const HistoryRecordDocumentEquality();

  @override
  bool equals(HistoryRecord? e1, HistoryRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.date == e2?.date &&
        e1?.actionType == e2?.actionType &&
        e1?.actionAmount == e2?.actionAmount &&
        e1?.actionLocation == e2?.actionLocation;
  }

  @override
  int hash(HistoryRecord? e) => const ListEquality().hash(
      [e?.name, e?.date, e?.actionType, e?.actionAmount, e?.actionLocation]);

  @override
  bool isValidKey(Object? o) => o is HistoryRecord;
}
