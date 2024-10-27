import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Transactions" field.
  List<TransactionStruct>? _transactions;
  List<TransactionStruct> get transactions => _transactions ?? const [];
  bool hasTransactions() => _transactions != null;

  // "bills" field.
  List<BillStruct>? _bills;
  List<BillStruct> get bills => _bills ?? const [];
  bool hasBills() => _bills != null;

  // "pocketAmount" field.
  double? _pocketAmount;
  double get pocketAmount => _pocketAmount ?? 0.0;
  bool hasPocketAmount() => _pocketAmount != null;

  // "goals" field.
  List<GoalStruct>? _goals;
  List<GoalStruct> get goals => _goals ?? const [];
  bool hasGoals() => _goals != null;

  // "ActionHistory" field.
  List<HistoryStruct>? _actionHistory;
  List<HistoryStruct> get actionHistory => _actionHistory ?? const [];
  bool hasActionHistory() => _actionHistory != null;

  // "userService" field.
  List<DocumentReference>? _userService;
  List<DocumentReference> get userService => _userService ?? const [];
  bool hasUserService() => _userService != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _transactions = getStructList(
      snapshotData['Transactions'],
      TransactionStruct.fromMap,
    );
    _bills = getStructList(
      snapshotData['bills'],
      BillStruct.fromMap,
    );
    _pocketAmount = castToType<double>(snapshotData['pocketAmount']);
    _goals = getStructList(
      snapshotData['goals'],
      GoalStruct.fromMap,
    );
    _actionHistory = getStructList(
      snapshotData['ActionHistory'],
      HistoryStruct.fromMap,
    );
    _userService = getDataList(snapshotData['userService']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  double? pocketAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'pocketAmount': pocketAmount,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.transactions, e2?.transactions) &&
        listEquality.equals(e1?.bills, e2?.bills) &&
        e1?.pocketAmount == e2?.pocketAmount &&
        listEquality.equals(e1?.goals, e2?.goals) &&
        listEquality.equals(e1?.actionHistory, e2?.actionHistory) &&
        listEquality.equals(e1?.userService, e2?.userService);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.transactions,
        e?.bills,
        e?.pocketAmount,
        e?.goals,
        e?.actionHistory,
        e?.userService
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
