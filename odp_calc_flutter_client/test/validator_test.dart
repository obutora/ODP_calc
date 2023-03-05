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

    test("半角・全角数字のみの入力を許容しない", () {
      final val = Validator.isNotNum('１２３４５６７８９０');
      expect(val, '全角・半角数字のみは入力できません');

      final val2 = Validator.isNotNum('1234567890');
      expect(val2, '全角・半角数字のみは入力できません');

      final val3 = Validator.isNotNum('アムロジピン5mg');
      expect(val3, null);
    });
  });
}
