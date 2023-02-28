import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/med_master_repository.dart';

final medMasterRepositoryProvider =
    Provider<MedMasterRepository>((ref) => MedMasterRepository());
