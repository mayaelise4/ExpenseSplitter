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
    await _safeInitAsync(() async {
      _goals = (await secureStorage.getStringList('ff_goals'))
              ?.map((x) {
                try {
                  return GoalStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _goals;
    });
    await _safeInitAsync(() async {
      _bills = (await secureStorage.getStringList('ff_bills'))
              ?.map((x) {
                try {
                  return BillStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _bills;
    });
    await _safeInitAsync(() async {
      _incompleteTaskExists =
          await secureStorage.getBool('ff_incompleteTaskExists') ??
              _incompleteTaskExists;
    });
    await _safeInitAsync(() async {
      _income = (await secureStorage.getStringList('ff_income'))
              ?.map((x) {
                try {
                  return IncomeStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _income;
    });
    await _safeInitAsync(() async {
      _userinput = await secureStorage.getString('ff_userinput') ?? _userinput;
    });
    await _safeInitAsync(() async {
      _geminiresponse =
          await secureStorage.getString('ff_geminiresponse') ?? _geminiresponse;
    });
    await _safeInitAsync(() async {
      _chat = await secureStorage.getString('ff_chat') ?? _chat;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

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

  double _totalSpending = 0.0;
  double get totalSpending => _totalSpending;
  set totalSpending(double value) {
    _totalSpending = value;
    secureStorage.setDouble('ff_totalSpending', value);
  }

  void deleteTotalSpending() {
    secureStorage.delete(key: 'ff_totalSpending');
  }

  List<GoalStruct> _goals = [];
  List<GoalStruct> get goals => _goals;
  set goals(List<GoalStruct> value) {
    _goals = value;
    secureStorage.setStringList(
        'ff_goals', value.map((x) => x.serialize()).toList());
  }

  void deleteGoals() {
    secureStorage.delete(key: 'ff_goals');
  }

  void addToGoals(GoalStruct value) {
    goals.add(value);
    secureStorage.setStringList(
        'ff_goals', _goals.map((x) => x.serialize()).toList());
  }

  void removeFromGoals(GoalStruct value) {
    goals.remove(value);
    secureStorage.setStringList(
        'ff_goals', _goals.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromGoals(int index) {
    goals.removeAt(index);
    secureStorage.setStringList(
        'ff_goals', _goals.map((x) => x.serialize()).toList());
  }

  void updateGoalsAtIndex(
    int index,
    GoalStruct Function(GoalStruct) updateFn,
  ) {
    goals[index] = updateFn(_goals[index]);
    secureStorage.setStringList(
        'ff_goals', _goals.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInGoals(int index, GoalStruct value) {
    goals.insert(index, value);
    secureStorage.setStringList(
        'ff_goals', _goals.map((x) => x.serialize()).toList());
  }

  List<BillStruct> _bills = [];
  List<BillStruct> get bills => _bills;
  set bills(List<BillStruct> value) {
    _bills = value;
    secureStorage.setStringList(
        'ff_bills', value.map((x) => x.serialize()).toList());
  }

  void deleteBills() {
    secureStorage.delete(key: 'ff_bills');
  }

  void addToBills(BillStruct value) {
    bills.add(value);
    secureStorage.setStringList(
        'ff_bills', _bills.map((x) => x.serialize()).toList());
  }

  void removeFromBills(BillStruct value) {
    bills.remove(value);
    secureStorage.setStringList(
        'ff_bills', _bills.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBills(int index) {
    bills.removeAt(index);
    secureStorage.setStringList(
        'ff_bills', _bills.map((x) => x.serialize()).toList());
  }

  void updateBillsAtIndex(
    int index,
    BillStruct Function(BillStruct) updateFn,
  ) {
    bills[index] = updateFn(_bills[index]);
    secureStorage.setStringList(
        'ff_bills', _bills.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBills(int index, BillStruct value) {
    bills.insert(index, value);
    secureStorage.setStringList(
        'ff_bills', _bills.map((x) => x.serialize()).toList());
  }

  bool _incompleteTaskExists = false;
  bool get incompleteTaskExists => _incompleteTaskExists;
  set incompleteTaskExists(bool value) {
    _incompleteTaskExists = value;
    secureStorage.setBool('ff_incompleteTaskExists', value);
  }

  void deleteIncompleteTaskExists() {
    secureStorage.delete(key: 'ff_incompleteTaskExists');
  }

  List<IncomeStruct> _income = [];
  List<IncomeStruct> get income => _income;
  set income(List<IncomeStruct> value) {
    _income = value;
    secureStorage.setStringList(
        'ff_income', value.map((x) => x.serialize()).toList());
  }

  void deleteIncome() {
    secureStorage.delete(key: 'ff_income');
  }

  void addToIncome(IncomeStruct value) {
    income.add(value);
    secureStorage.setStringList(
        'ff_income', _income.map((x) => x.serialize()).toList());
  }

  void removeFromIncome(IncomeStruct value) {
    income.remove(value);
    secureStorage.setStringList(
        'ff_income', _income.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromIncome(int index) {
    income.removeAt(index);
    secureStorage.setStringList(
        'ff_income', _income.map((x) => x.serialize()).toList());
  }

  void updateIncomeAtIndex(
    int index,
    IncomeStruct Function(IncomeStruct) updateFn,
  ) {
    income[index] = updateFn(_income[index]);
    secureStorage.setStringList(
        'ff_income', _income.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInIncome(int index, IncomeStruct value) {
    income.insert(index, value);
    secureStorage.setStringList(
        'ff_income', _income.map((x) => x.serialize()).toList());
  }

  String _userinput = '';
  String get userinput => _userinput;
  set userinput(String value) {
    _userinput = value;
    secureStorage.setString('ff_userinput', value);
  }

  void deleteUserinput() {
    secureStorage.delete(key: 'ff_userinput');
  }

  String _geminiresponse = '';
  String get geminiresponse => _geminiresponse;
  set geminiresponse(String value) {
    _geminiresponse = value;
    secureStorage.setString('ff_geminiresponse', value);
  }

  void deleteGeminiresponse() {
    secureStorage.delete(key: 'ff_geminiresponse');
  }

  String _chat = '';
  String get chat => _chat;
  set chat(String value) {
    _chat = value;
    secureStorage.setString('ff_chat', value);
  }

  void deleteChat() {
    secureStorage.delete(key: 'ff_chat');
  }

  bool _isIntroductionExpanded = false;
  bool get isIntroductionExpanded => _isIntroductionExpanded;
  set isIntroductionExpanded(bool value) {
    _isIntroductionExpanded = value;
  }

  bool _isSettingFinancialGoalsExpanded = false;
  bool get isSettingFinancialGoalsExpanded => _isSettingFinancialGoalsExpanded;
  set isSettingFinancialGoalsExpanded(bool value) {
    _isSettingFinancialGoalsExpanded = value;
  }

  bool _isBudgetingBasicsExpanded = false;
  bool get isBudgetingBasicsExpanded => _isBudgetingBasicsExpanded;
  set isBudgetingBasicsExpanded(bool value) {
    _isBudgetingBasicsExpanded = value;
  }

  bool _isManagingIrregularIncomeExpanded = false;
  bool get isManagingIrregularIncomeExpanded =>
      _isManagingIrregularIncomeExpanded;
  set isManagingIrregularIncomeExpanded(bool value) {
    _isManagingIrregularIncomeExpanded = value;
  }

  bool _isBuildingCreditExpanded = false;
  bool get isBuildingCreditExpanded => _isBuildingCreditExpanded;
  set isBuildingCreditExpanded(bool value) {
    _isBuildingCreditExpanded = value;
  }

  bool _isUnderstandingDebtExpanded = false;
  bool get isUnderstandingDebtExpanded => _isUnderstandingDebtExpanded;
  set isUnderstandingDebtExpanded(bool value) {
    _isUnderstandingDebtExpanded = value;
  }

  bool _isChoosingTheBestCreditCardForYouExpanded = false;
  bool get isChoosingTheBestCreditCardForYouExpanded =>
      _isChoosingTheBestCreditCardForYouExpanded;
  set isChoosingTheBestCreditCardForYouExpanded(bool value) {
    _isChoosingTheBestCreditCardForYouExpanded = value;
  }

  bool _isSmartBorrowingExpanded = false;
  bool get isSmartBorrowingExpanded => _isSmartBorrowingExpanded;
  set isSmartBorrowingExpanded(bool value) {
    _isSmartBorrowingExpanded = value;
  }

  bool _isGoalOrientedSavingExpanded = false;
  bool get isGoalOrientedSavingExpanded => _isGoalOrientedSavingExpanded;
  set isGoalOrientedSavingExpanded(bool value) {
    _isGoalOrientedSavingExpanded = value;
  }

  bool _isGrantsAndScholarshipsExpanded = false;
  bool get isGrantsAndScholarshipsExpanded => _isGrantsAndScholarshipsExpanded;
  set isGrantsAndScholarshipsExpanded(bool value) {
    _isGrantsAndScholarshipsExpanded = value;
  }

  bool _isStudentLoansExpanded = false;
  bool get isStudentLoansExpanded => _isStudentLoansExpanded;
  set isStudentLoansExpanded(bool value) {
    _isStudentLoansExpanded = value;
  }

  bool _isBestPracticesExpanded = false;
  bool get isBestPracticesExpanded => _isBestPracticesExpanded;
  set isBestPracticesExpanded(bool value) {
    _isBestPracticesExpanded = value;
  }

  bool _isRecognizingScamsExpanded = false;
  bool get isRecognizingScamsExpanded => _isRecognizingScamsExpanded;
  set isRecognizingScamsExpanded(bool value) {
    _isRecognizingScamsExpanded = value;
  }

  bool _isInvestingOptionsExpanded = false;
  bool get isInvestingOptionsExpanded => _isInvestingOptionsExpanded;
  set isInvestingOptionsExpanded(bool value) {
    _isInvestingOptionsExpanded = value;
  }

  bool _isBasicInvestmentStrategiesExpanded = false;
  bool get isBasicInvestmentStrategiesExpanded =>
      _isBasicInvestmentStrategiesExpanded;
  set isBasicInvestmentStrategiesExpanded(bool value) {
    _isBasicInvestmentStrategiesExpanded = value;
  }

  bool _isInvestmentResourcesAndToolsExpanded = false;
  bool get isInvestmentResourcesAndToolsExpanded =>
      _isInvestmentResourcesAndToolsExpanded;
  set isInvestmentResourcesAndToolsExpanded(bool value) {
    _isInvestmentResourcesAndToolsExpanded = value;
  }

  bool _isWorkStudyExpanded = false;
  bool get isWorkStudyExpanded => _isWorkStudyExpanded;
  set isWorkStudyExpanded(bool value) {
    _isWorkStudyExpanded = value;
  }

  bool _onSplitterChat = false;
  bool get onSplitterChat => _onSplitterChat;
  set onSplitterChat(bool value) {
    _onSplitterChat = value;
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
