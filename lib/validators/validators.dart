import 'package:flutter/material.dart';

class Validators {
  static String? validateUserName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'null';
    }
    if (value.length < 3) {
      return 'null';
    }
    return null;
  }

  static String? validateFirstName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'please enter first name';
    }
    return null;
  }

  static String? validateLastName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'null';
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return '';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'null';
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'null';
    }
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
    if (!passwordRegExp.hasMatch(value)) {
      return 'null';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value, String? password, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'null';
    }
    if (value != password) {
      return 'null';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'null';
    }
    final phoneRegExp = RegExp(r'^\d{10,15}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'null';
    }
    return null;
  }
}
