import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  static LatLng getPrefecturePrimarySpot(int n) {
    switch (n) {
      case 1:
        return const LatLng(43.068872199379186, 141.35080894144335);
      case 2:
        return const LatLng(40.8288777331682, 140.7346162511356);
      case 3:
        return const LatLng(39.704991305332655, 141.13456692738572);
      case 4:
        return const LatLng(38.260291642377204, 140.88244822591128);
      case 5:
        return const LatLng(39.717068881307334, 140.12968615294733);
      case 6:
        return const LatLng(38.2491959003308, 140.32720623754716);
      case 7:
        return const LatLng(37.75447729041083, 140.45919678441024);
      case 8:
        return const LatLng(36.37095377269737, 140.47624362398898);
      case 9:
        return const LatLng(36.37183155428607, 139.7314403258438);
      case 10:
        return const LatLng(36.32714523402701, 139.0105077832966);
      case 11:
        return const LatLng(35.910081809191674, 139.6243968266694);
      case 12:
        return const LatLng(35.61291626933945, 140.113566594756);
      case 13:
        return const LatLng(35.68145404892084, 139.76716771232913);
      case 14:
        return const LatLng(35.466103415089655, 139.62199762395792);
      case 15:
        return const LatLng(37.912326574511496, 139.06181791240778);
      case 16:
        return const LatLng(36.70199881807927, 137.2125506951643);
      case 17:
        return const LatLng(36.57814448200571, 136.64820211065208);
      case 18:
        return const LatLng(36.06196260821276, 136.2234383086328);
      case 19:
        return const LatLng(35.67007992433451, 138.56881647027365);
      case 20:
        return const LatLng(36.643287840930675, 138.18870807003523);
      case 21:
        return const LatLng(35.40973764412015, 136.75644413930152);
      case 22:
        return const LatLng(34.97240676842749, 138.3887932085957);
      case 23:
        return const LatLng(35.171107923432274, 136.88153689696634);
      case 24:
        return const LatLng(34.73418645471776, 136.51032922764256);
      case 25:
        return const LatLng(35.003733628222896, 135.8647456679247);
      case 26:
        return const LatLng(34.98595117032749, 135.7588180245371);
      case 27:
        return const LatLng(34.69276070551103, 135.5317387216106);
      case 28:
        return const LatLng(34.82704327913047, 134.69041457975445);
      case 29:
        return const LatLng(34.681213546907394, 135.8195308975426);
      case 30:
        return const LatLng(34.23233994443118, 135.19170576624387);
      case 31:
        return const LatLng(35.49420681576004, 134.2259202541416);
      case 32:
        return const LatLng(35.36374534728094, 132.7570235895631);
      case 33:
        return const LatLng(34.666368259316066, 133.91774422578558);
      case 34:
        return const LatLng(34.3978971518094, 132.47534641043126);
      case 35:
        return const LatLng(34.17310178014157, 131.48092462391472);
      case 36:
        return const LatLng(34.07448759590957, 134.55109682391156);
      case 37:
        return const LatLng(35.35664068174692, 139.39974389511772);
      case 38:
        return const LatLng(33.840689238208746, 132.75484328655102);
      case 39:
        return const LatLng(33.567535128973724, 133.54373913924047);
      case 40:
        return const LatLng(33.589174228864586, 130.3998295527321);
      case 41:
        return const LatLng(33.26443643715974, 130.29747189875826);
      case 42:
        return const LatLng(32.752501189762164, 129.8688948527053);
      case 43:
        return const LatLng(32.79040974380893, 130.6899583122339);
      case 44:
        return const LatLng(33.23328591822894, 131.60640252573884);
      case 45:
        return const LatLng(31.91595896783144, 131.4321352661703);
      case 46:
        return const LatLng(31.585341904724753, 130.54135504789096);
      case 47:
        return const LatLng(26.206701689319736, 127.6465851120481);
      default:
        return const LatLng(34.69276070551103, 135.5317387216106);
    }
  }
}
