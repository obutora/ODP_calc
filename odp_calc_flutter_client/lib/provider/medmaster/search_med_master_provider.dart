import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/med_master.dart';
import '../form/input/search_med_master_input_state_provider.dart';
import '../repository/repository_provider.dart';

final searhMedMasterProvider = FutureProvider<List<MedMaster?>>(
  (ref) async {
    final medMasterRepository = ref.watch(medMasterRepositoryProvider);
    final searchWord = ref.watch(searchMedMasterInputStateProvider);

    // なにも入力されていない場合は空のリストを返す
    if (searchWord.isEmpty) {
      // print('empty');
      return throw '検索ワードが入力されていません。';
    }

    // 数字のみの場合はgs1で検索
    if (int.tryParse(searchWord) != null) {
      // print('is number');

      // GS-1コードは index 2桁 + 14桁の数字であることを確認する
      if (searchWord.length != 16) {
        return throw '正しいGS-1コードではありません。';
      }

      // 最初2文字はGS-1コードの識別子だが、DBには入っていないので削除する
      final gs1CodeString = searchWord.substring(2, searchWord.length);
      final gs1Code = int.parse(gs1CodeString);

      final medMasters = await medMasterRepository.getByGs1(gs1Code);

      if (medMasters.isEmpty) {
        return throw 'GS-1コードが見つかりませんでした。';
      } else {
        return medMasters;
      }
    }

    // 3文字以上の場合はnameで検索
    if (searchWord.length > 3) {
      // print('not empty');
      return await medMasterRepository.getByName(searchWord);
    } else {
      return throw '検索ワードが短すぎます。';
    }

    // return [];
  },
);
