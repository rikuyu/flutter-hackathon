import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static void showSnackBar(BuildContext context, String text, Color color) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(text),
        backgroundColor: color,
      ));

  static String createAuthErrorMessage(dynamic code) {
    if ((code is String) == false) return "不明なエラー";
    switch (code) {
      case "email-already-in-use":
        return "すでに使用されているメールアドレスです";
      case "invalid-email":
        return "メールアドレスの形式のが正しくありません";
      case "weak-password":
        return "パスワードが弱すぎます";
      case "operation-not-allowed":
        return "不適切なメールアドレス/パスワードです";
      case "user-disabled":
        return "無効なユーザーです";
      case "user-not-found":
        return "不明なユーザーです";
      case "wrong-password":
        return "パスワードが違います";
      case "empty-item":
        return "未入力項目があります";
      case "password-not-confirmed":
        return "パスワードが一致しません";
      case "unknown-error":
        return "不明なエラー";
      default:
        return "不明なエラー";
    }
  }

  static String convertDate(String text) {
    if (text.isEmpty) return text;
    final dateString = text.split("-");
    final d = int.parse(dateString.last.split("").take(2).toList().join());
    dateString.removeLast();
    final dateInt = dateString.map((e) => int.parse(e)).toList();
    dateInt.insert(dateInt.length, d);
    return dateInt.join("/");
  }
}
