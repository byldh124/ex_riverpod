import 'package:flutter_riverpod/flutter_riverpod.dart';

// 사용하지 않을때 데이터가 삭제된다
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));

  return [1, 2, 3, 4, 5];
});
