import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SearchCheckBoxState {
  patientName,
  medName,
}

final searchCheckBoxProvider = StateProvider<SearchCheckBoxState>((ref) {
  return SearchCheckBoxState.patientName;
});
