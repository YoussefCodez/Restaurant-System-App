import 'package:hive/hive.dart';
import 'package:restaurant/features/add_card/data/entities/credit_card_entity.dart';
import 'package:restaurant/features/favourites/data/models/favourite_item_model.dart';

class HiveService {
  static const String _boxName = 'userBox';
  static const String _userNameKey = 'userName';
  static const String _userAddressKey = 'userAddress';
  static const String _userPhoneKey = 'userPhone';
  static const String _userGovernorateKey = 'userGovernorate';
  static const String _categoryBoxKey = 'categoryBox';
  static const String _categoryKey = 'categoryList';
  static const String _menuBoxName = 'menuBox';
  static const String _menuKey = 'menuList';
  static const String _favouriteBoxName = 'favouriteBox';
  static const String _favouriteKey = 'favouriteList';
  static const String _favouriteStateKey = 'favouriteStateBox';
  static const String _creditCardBoxName = 'creditCardBox';
  static const String _creditCardNameKey = 'creditCardList';
  static const String _darkModeKey = 'darkMode';
  static const String _darkModeBox = 'darkModeBox';

  // =============================== Dark Mode ===============================

  bool getChachedDarkMode() {
    final box = Hive.box(_darkModeBox);
    final data = box.get(_darkModeKey);
    return data ?? false;
  }

  Future<void> cacheDarkMode(bool mode) async {
    final box = Hive.box(_darkModeBox);
    await box.put(_darkModeKey, mode);
  }

  // =============================== User ===============================

  String? getCachedUserName() {
    final box = Hive.box(_boxName);
    final data = box.get(_userNameKey);
    return data;
  }

  Future<void> cacheUserName(String name) async {
    final box = Hive.box(_boxName);
    await box.put(_userNameKey, name);
  }

  Future<void> clearUserName() async {
    final box = Hive.box(_boxName);
    await box.delete(_userNameKey);
  }

  String? getCachedUserAddress() {
    final box = Hive.box(_boxName);
    final data = box.get(_userAddressKey);
    return data;
  }

  Future<void> cacheUserAddress(String address) async {
    final box = Hive.box(_boxName);
    await box.put(_userAddressKey, address);
  }

  Future<void> clearUserAddress() async {
    final box = Hive.box(_boxName);
    await box.delete(_userAddressKey);
  }

  String? getCachedUserPhone() {
    final box = Hive.box(_boxName);
    final data = box.get(_userPhoneKey);
    return data;
  }

  Future<void> cacheUserPhone(String phone) async {
    final box = Hive.box(_boxName);
    await box.put(_userPhoneKey, phone);
  }

  Future<void> clearUserPhone() async {
    final box = Hive.box(_boxName);
    await box.delete(_userPhoneKey);
  }

  String? getCachedUserGovernorate() {
    final box = Hive.box(_boxName);
    final data = box.get(_userGovernorateKey);
    return data;
  }

  Future<void> cacheUserGovernorate(String governorate) async {
    final box = Hive.box(_boxName);
    await box.put(_userGovernorateKey, governorate);
  }

  Future<void> clearUserGovernorate() async {
    final box = Hive.box(_boxName);
    await box.delete(_userGovernorateKey);
  }

  // =============================== Category ===============================

  List<Map<String, dynamic>>? getCachedCategory() {
    final box = Hive.box(_categoryBoxKey);
    final data = box.get(_categoryKey);
    if (data == null) return null;
    return (data as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  Future<void> cacheCategory(List<Map<String, dynamic>> category) async {
    final box = Hive.box(_categoryBoxKey);
    await box.put(_categoryKey, category);
  }

  Future<void> clearCategory() async {
    final box = Hive.box(_categoryBoxKey);
    await box.delete(_categoryKey);
  }

  // =============================== Menu ===============================

  List<Map<String, dynamic>>? getCachedMenu() {
    final box = Hive.box(_menuBoxName);
    final data = box.get(_menuKey);
    if (data == null) return null;
    return (data as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  Future<void> cacheMenu(List<Map<String, dynamic>> menu) async {
    final box = Hive.box(_menuBoxName);
    await box.put(_menuKey, menu);
  }

  Future<void> clearMenu() async {
    final box = Hive.box(_menuBoxName);
    await box.delete(_menuKey);
  }

  // =============================== Favourites = [State (IDs)] ===============================

  List<String> getCachedState() {
    final box = Hive.box(_favouriteStateKey);
    final data = box.get(_favouriteStateKey);
    if (data is List) {
      return data.cast<String>();
    }
    return <String>[];
  }

  Future<void> cacheState(List<String> state) async {
    final box = Hive.box(_favouriteStateKey);
    await box.put(_favouriteStateKey, state);
  }

  // =============================== Favourites = [Items (Models)] ===============================

  List<FavouriteItemModel> getCachedFavouriteItems() {
    final box = Hive.box(_favouriteBoxName);
    final data = box.get(_favouriteKey);
    if (data == null) return [];
    return (data as List)
        .map(
          (e) =>
              FavouriteItemModel.fromMap(Map<String, dynamic>.from(e as Map)),
        )
        .toList();
  }

  Future<void> cacheFavouriteItems(List<FavouriteItemModel> items) async {
    final box = Hive.box(_favouriteBoxName);
    final data = items.map((e) => e.toMap()).toList();
    await box.put(_favouriteKey, data);
  }

  Future<void> clearFavouriteItems() async {
    final box = Hive.box(_favouriteBoxName);
    await box.delete(_favouriteKey);
  }

  // =============================== Credit Cards ===============================

  List<CreditCardEntity> getCachedCreditCards() {
    final box = Hive.box(_creditCardBoxName);
    final data = box.get(_creditCardNameKey);
    if (data == null) return [];
    return (data as List)
      .map((e) => CreditCardEntity.fromMap(Map<String, dynamic>.from(e as Map)))
      .toList();
  }

  Future<void> cacheCreditCards(List<CreditCardEntity> creditCards) async {
    final box = Hive.box(_creditCardBoxName);
    final data = creditCards.map((e) => e.toMap()).toList();
    await box.put(_creditCardNameKey, data);
  }

  Future<void> deleteCreditCard(String cardNumber) async {
    final cards = getCachedCreditCards();
    cards.removeWhere((card) => card.cardNumber == cardNumber);
    await cacheCreditCards(cards);
  }
}
