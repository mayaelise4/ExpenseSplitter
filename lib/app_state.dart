import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _pocketAmount =
          await secureStorage.getDouble('ff_pocketAmount') ?? _pocketAmount;
    });
    await _safeInitAsync(() async {
      _Transactions = (await secureStorage.getStringList('ff_Transactions'))
              ?.map((x) {
                try {
                  return TransactionStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Transactions;
    });
    await _safeInitAsync(() async {
      _totalSpending =
          await secureStorage.getDouble('ff_totalSpending') ?? _totalSpending;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  double _pocketAmount = 0.0;
  double get pocketAmount => _pocketAmount;
  set pocketAmount(double value) {
    _pocketAmount = value;
    secureStorage.setDouble('ff_pocketAmount', value);
  }

  void deletePocketAmount() {
    secureStorage.delete(key: 'ff_pocketAmount');
  }

  List<TransactionStruct> _Transactions = [];
  List<TransactionStruct> get Transactions => _Transactions;
  set Transactions(List<TransactionStruct> value) {
    _Transactions = value;
    secureStorage.setStringList(
        'ff_Transactions', value.map((x) => x.serialize()).toList());
  }

  void deleteTransactions() {
    secureStorage.delete(key: 'ff_Transactions');
  }

  void addToTransactions(TransactionStruct value) {
    Transactions.add(value);
    secureStorage.setStringList(
        'ff_Transactions', _Transactions.map((x) => x.serialize()).toList());
  }

  void removeFromTransactions(TransactionStruct value) {
    Transactions.remove(value);
    secureStorage.setStringList(
        'ff_Transactions', _Transactions.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransactions(int index) {
    Transactions.removeAt(index);
    secureStorage.setStringList(
        'ff_Transactions', _Transactions.map((x) => x.serialize()).toList());
  }

  void updateTransactionsAtIndex(
    int index,
    TransactionStruct Function(TransactionStruct) updateFn,
  ) {
    Transactions[index] = updateFn(_Transactions[index]);
    secureStorage.setStringList(
        'ff_Transactions', _Transactions.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransactions(int index, TransactionStruct value) {
    Transactions.insert(index, value);
    secureStorage.setStringList(
        'ff_Transactions', _Transactions.map((x) => x.serialize()).toList());
  }

  String _userinput = '';
  String get userinput => _userinput;
  set userinput(String value) {
    _userinput = value;
  }

  List<String> _chatconvo = [];
  List<String> get chatconvo => _chatconvo;
  set chatconvo(List<String> value) {
    _chatconvo = value;
  }

  void addToChatconvo(String value) {
    chatconvo.add(value);
  }

  void removeFromChatconvo(String value) {
    chatconvo.remove(value);
  }

  void removeAtIndexFromChatconvo(int index) {
    chatconvo.removeAt(index);
  }

  void updateChatconvoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    chatconvo[index] = updateFn(_chatconvo[index]);
  }

  void insertAtIndexInChatconvo(int index, String value) {
    chatconvo.insert(index, value);
  }

  double _totalSpending = 0.0;
  double get totalSpending => _totalSpending;
  set totalSpending(double value) {
    _totalSpending = value;
    secureStorage.setDouble('ff_totalSpending', value);
  }

  void deleteTotalSpending() {
    secureStorage.delete(key: 'ff_totalSpending');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
