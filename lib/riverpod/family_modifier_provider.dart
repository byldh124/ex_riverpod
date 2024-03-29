import 'package:flutter_riverpod/flutter_riverpod.dart';




// 프로바이더 생성시 변수를 받아야 할 때
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 1));

  return List.generate(5, (index) => index * data);

  return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});
