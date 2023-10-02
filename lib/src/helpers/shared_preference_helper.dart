//import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:amar_dokan_app/src/helpers/l10n/local_extension.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/enums.dart';

class SharedPreferencesHelper {
  static SharedPreferences? prefs;
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }


  static const _LOCALE_KEY = 'locale';
  static void saveLocale(SupportedLocale locale) {
    prefs!.setString(_LOCALE_KEY, locale.code);
  }

  static Locale getLocale() {
    final dynamic localeCode = prefs!.get(_LOCALE_KEY) ?? ' ';
    if (localeCode.isEmpty) throw 'Locale not found';
    return Locale(localeCode);
  }

  static Future<bool> setTheme(String theme) async {
    return prefs!.setString("theme", theme);
  }

  static Future<String> getTheme() async {
    return prefs!.getString("theme") ?? "light";
  }

  static Future<bool> setLoginFlag(bool flag) async {
    return prefs!.setBool("isLoggedIn", flag);
  }

  static Future<bool> getLoginFlag() async {
    return prefs!.getBool("isLoggedIn") ?? false;
  }

  static Future<bool> setAccountsType(String accountsType) async {
    return prefs!.setString("accounts_type", accountsType);
  }

  static Future<String> getAccountsType() async {
    return prefs!.getString("accounts_type") ?? ''; // 4293467747
  }

  static Future<bool> setToken(String? token) async {
    return prefs!.setString("accesstoken", token!);
  }

  static Future<String> getToken() async {
    return prefs!.getString("accesstoken") ?? ''; // 4293467747
  }

  static Future<bool> setLoginUserId(int userId) async {
    return prefs!.setInt("loginUserId", userId);
  }

  static Future<int> getLoginUserId() async {
    return prefs!.getInt("loginUserId") ?? 0;
  }

  static Future<bool> setLoginUserName(username) async {
    return prefs!.setString("user_name", username ?? '');
  }

  static Future<String> getLoginUserName() async {
    return prefs!.getString("user_name") ?? '';
  }

  static Future<bool> setLoginUserMobileNo(mobileno) async {
    return prefs!.setString("user_mobile_no", mobileno ?? '');
  }

  static Future<String> getLoginUserMobileNo() async {
    return prefs!.getString("user_mobile_no") ?? '';
  }

  static Future<bool> setUserAddress(String user_address) async {
    return prefs!.setString("address", user_address);
  }

  static Future<String> getUserAddress() async {
    return prefs!.getString("address") ?? ''; // 4293467747
  }

  static Future<bool> setIsCustomerAccount(bool isCustomerAccount) async {
    return prefs!.setBool("is_customer_account", isCustomerAccount);
  }

  static Future<bool> getIsCustomerAccount() async {
    return prefs!.getBool("is_customer_account") ?? false;
  }

  static Future<bool> setIsAdminAccount(bool isAdminAccount) async {
    return prefs!.setBool("is_admin_account", isAdminAccount);
  }

  static Future<bool> getIsAdminAccount() async {
    return prefs!.getBool("is_admin_account") ?? false;
  }

  static Future<bool> setIsSupplierAccount(bool isSupplierAccount) async {
    return prefs!.setBool("is_supplier_account", isSupplierAccount);
  }

  static Future<bool> getIsSupplierAccount() async {
    return prefs!.getBool("is_supplier_account") ?? false;
  }

  static Future<bool> setIsDeliveryAccount(bool isDeliveryAccount) async {
    return prefs!.setBool("is_delivery_account", isDeliveryAccount);
  }

  static Future<bool> getIsDeliveryAccount() async {
    return prefs!.getBool("is_delivery_account") ?? false;
  }
}
