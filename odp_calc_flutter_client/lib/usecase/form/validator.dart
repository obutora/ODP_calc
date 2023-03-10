class Validator {
  static String? notContainSpace(String? value) {
    if (value!.contains(' ') || value.contains('　')) {
      return '空白は不要です';
    }
    return null;
  }

  static String? notEmpty(String? value) {
    if (value!.isEmpty) {
      return 'なにか入力してください';
    }
    return null;
  }

  static String? onlyKatakana(String? value) {
    // カタカナにマッチする正規表現
    final reg = RegExp(r'^[\u30A0-\u30FF]+$');

    if (!reg.hasMatch(value!)) {
      return 'カタカナだけ入力してください';
    }

    return null;
  }

  // 数値のみのStringを許容しない
  // -> 全てが数値の時にエラーメッセージを返却する
  static String? isNotNum(String? value) {
    final reg = RegExp(r'^[0-9０-９]+$');

    if (reg.hasMatch(value!)) {
      return '全角・半角数字のみは入力できません';
    }
    return null;
  }

  static String? isNum(String? value) {
    final isNum = int.tryParse(value!);

    if (isNum == null) {
      return '半角数字だけ入力してください';
    }

    return null;
  }

  static String? validate({
    required String? value,
    required List<String?> validationList,
  }) {
    for (final validation in validationList) {
      if (validation != null) {
        return validation;
      }
    }
    return null;
  }
}
