import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 Provider를 사용할지 결정할 필요 없도록
// Provider, FutureProvider, StreamProvider
// StateNotifierProvider

final _testProvider = Provider<String>((ref) => 'Hello code generation');

@riverpod //AutoDispose modifier 가 자동으로 적용됨
String gState(GStateRef ref) {
  return 'Hello code generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 2));

  return 10;
}

@Riverpod(
  // 살려둬라
    keepAlive: true //default value : false,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 2));

  return 10;
}

// 2) Parameter -> Family 파라미터를 일반 함수처럼 사용할 수 있도록

class Parameter {
  int number1;
  int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

final _testFamilyProvider = Provider.family<int, Parameter>(
        (ref, parameter) => parameter.number1 * parameter.number2);


@riverpod
int gStateMultiply(GStateMultiplyRef ref,
    {required int number1, required int number2}) {
  return number1 * number2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier {

  //build() - override 필수 (초기값 지정)
  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }

}
