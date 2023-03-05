import 'package:flutter_test/flutter_test.dart';
import 'package:odp_calc_flutter_client/usecase/form/validator.dart';

main() {
  group("validation", () {
    test("半角・全角数字ではない", () {
      final val = Validator.isNotNum('１２３４５６７８９０');
      expect(val, '全角・半角数字のみは入力できません');

      final val2 = Validator.isNotNum('1234567890');
      expect(val2, '全角・半角数字のみは入力できません');

      final val3 = Validator.isNotNum('アムロジピン5mg');
      expect(val3, null);
    });
  });
}
