import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String authToken = 'authToken';
  static const String userId = 'userId';
  static const String phoneNumber = 'phoneNumber';
  static const String countryCode = 'countryCode';
  static const String templateName1 = 'templateName';
  static const String templateName2 = 'templateName';
  static const String templateName3 = 'templateName';
  static const String templateName4 = 'templateName';
  static const String bannerArea1 = 'bannerArea';

  /// Saves the authentication token
  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(authToken, token);
    log('Token saved in Shared Preference: $token');
  }

  /// Retrieves the authentication token
  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(authToken);
  }

  /// Removes the authentication token
  removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(authToken);
  }

  /// Saves the userid
  Future<void> saveUserId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(userId, id);
    log('userId saved in Shared Preference: $id');
  }

  /// Retrieves the userId
  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userId);
  }

  /// Removes the userId
  Future<void> removeUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userId);
  }

  Future<void> savePhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(phoneNumber, phone);
    log('Phone number saved in Shared Preference: $phone');
  }

  /// Retrieves the authentication token
  Future<String?> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(phoneNumber);
  }

  /// Removes the authentication token
  Future<void> removeNumber() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(phoneNumber);
  }

// Save country code
  Future<void> saveCountryCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(countryCode, code);
    log('CountryCode saved in Shared Preference: $code');
  }

  /// Retrieves the countryCode
  getCountryCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(countryCode);
  }

  /// Removes the countryCode
  Future<void> removeCountryCode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(countryCode);
  }

  // Save template name
  saveTemplateName1(String template) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(templateName1, template);
    log('Template Name1 saved in Shared Preference: $template');
  }

  /// Retrieves template name
  getTemplateName1() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(templateName1);
  }

  /// Removes the template name
  Future<void> removeTemplate1() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(templateName1);
  }

  // Save template name
  saveTemplateName2(String template) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(templateName2, template);
    log('Template Name2 saved in Shared Preference: $template');
  }

  /// Retrieves template name
  getTemplateName2() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(templateName2);
  }

  /// Removes the template name
  Future<void> removeTemplate2() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(templateName2);
  }

  // Save template name
  saveTemplateName3(String template) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(templateName3, template);
    log('Template Name3 saved in Shared Preference: $template');
  }

  /// Retrieves template name
  getTemplateName3() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(templateName3);
  }

  /// Removes the template name
  Future<void> removeTemplate3() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(templateName3);
  }

  // Save template name
  saveTemplateName4(String template) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(templateName4, template);
    log('Template4 Name saved in Shared Preference: $template');
  }

  /// Retrieves template name
  getTemplateName4() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(templateName4);
  }

  /// Removes the template name
  Future<void> removeTemplate4() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(templateName4);
  }
}
