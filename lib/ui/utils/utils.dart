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
      case "name_max_length":
        return "名前は最大15文字です";
      case "description_max_length":
        return "あいさつは最大200文字です";
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

  static String createPrefectureName(int n) {
    switch (n) {
      case 0:
        return "日本全国";
      case 1:
        return "北海道";
      case 2:
        return "青森県";
      case 3:
        return "岩手県";
      case 4:
        return "宮城県";
      case 5:
        return "秋田県";
      case 6:
        return "山形県";
      case 7:
        return "福島県";
      case 8:
        return "茨城県";
      case 9:
        return "栃木県";
      case 10:
        return "群馬県";
      case 11:
        return "埼玉県";
      case 12:
        return "千葉県";
      case 13:
        return "東京都";
      case 14:
        return "神奈川県";
      case 15:
        return "新潟県";
      case 16:
        return "富山県";
      case 17:
        return "石川県";
      case 18:
        return "福井県";
      case 19:
        return "山梨県";
      case 20:
        return "長野県";
      case 21:
        return "岐阜県";
      case 22:
        return "静岡県";
      case 23:
        return "愛知県";
      case 24:
        return "三重県";
      case 25:
        return "滋賀県";
      case 26:
        return "京都府";
      case 27:
        return "大阪府";
      case 28:
        return "兵庫県";
      case 29:
        return "奈良県";
      case 30:
        return "和歌山県";
      case 31:
        return "鳥取県";
      case 32:
        return "島根県";
      case 33:
        return "岡山県";
      case 34:
        return "広島県";
      case 35:
        return "山口県";
      case 36:
        return "徳島県";
      case 37:
        return "香川県";
      case 38:
        return "愛媛県";
      case 39:
        return "高知県";
      case 40:
        return "福岡県";
      case 41:
        return "佐賀県";
      case 42:
        return "長崎県";
      case 43:
        return "熊本県";
      case 44:
        return "大分県";
      case 45:
        return "宮崎県";
      case 46:
        return "鹿児島県";
      case 47:
        return "沖縄県";
      default:
        return "";
    }
  }
}
