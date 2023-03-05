import 'package:flutter_test/flutter_test.dart';
import 'package:odp_calc_flutter_client/usecase/form/validator.dart';

main() {
  group("validation", () {
    test("半角・全角スペースを許容しない", () {
      final val = Validator.notContainSpace('a　b');
      expect(val, '空白は不要です');

      final val2 = Validator.notContainSpace('a b');
      expect(val2, '空白は不要です');

      final val3 = Validator.notContainSpace('アムロジピン5mg');
      expect(val3, null);
    });

    test("Emptyを許容しない", () {
      final val = Validator.notEmpty('');
      expect(val, 'なにか入力してください');

      final val2 = Validator.notEmpty('アムロジピン5mg');
      expect(val2, null);
    });

    test("カタカナ入力のみを許容する", () {
      final val = Validator.onlyKatakana('あいうえお');
      expect(val, 'カタカナだけ入力してください');

      final val2 = Validator.onlyKatakana('アムロジピン5mg');
      expect(val2, 'カタカナだけ入力してください');

      final val3 = Validator.onlyKatakana('アムロジピン');
      expect(val3, null);
    });

    test("半角・全角数字のみの入力を許容しない", () {
      final val = Validator.isNotNum('１２３４５６７８９０');
      expect(val, '全角・半角数字のみは入力できません');

      final val2 = Validator.isNotNum('1234567890');
      expect(val2, '全角・半角数字のみは入力できません');

      final val3 = Validator.isNotNum('アムロジピン5mg');
      expect(val3, null);
    });

    test("半角数字のみを許容する", () {
      final val = Validator.isNum('１２３４５６７８９０');
      expect(val, '半角数字だけ入力してください');

      final val2 = Validator.isNum('1234567890');
      expect(val2, null);

      final val3 = Validator.isNum('アムロジピン5mg');
      expect(val3, '半角数字だけ入力してください');
    });
  });
}
