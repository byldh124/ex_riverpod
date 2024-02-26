import 'package:ex_riverpod/layout/default_layout.dart';
import 'package:ex_riverpod/riverpod/code_generation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));
    //final state5 = ref.watch(gStateNotifierProvider);

    return DefaultLayout(
        title: 'CodeGeneration Screen',
        body: Column(children: [
          Text("State1 : $state1"),
          state2.when(
              data: (data) {
                return Text(
                  'state2 : $data',
                  textAlign: TextAlign.center,
                );
              },
              error: (error, stack) {
                return Text(error.toString());
              },
              loading: () =>
                  Center(
                    child: CircularProgressIndicator(),
                  )),
          state3.when(
              data: (data) {
                return Text(
                  'state3 : $data',
                  textAlign: TextAlign.center,
                );
              },
              error: (error, stack) {
                return Text(error.toString());
              },
              loading: () =>
                  Center(
                    child: CircularProgressIndicator(),
                  )),
          Text('State4: $state4'),
          //_StateFiveWidget(),
          Consumer(builder: (context, ref, child) {
            print('builder build');
            final _state5 = ref.watch(gStateNotifierProvider);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('State5 : $_state5'),
                child!,
              ],
            );
          },
          child: Text('hello'),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: Text('increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: Text('decrement'),
              ),
            ],
          ),
          // invalidate() - 유효하지 않게 하다
          ElevatedButton(
            onPressed: () {
              ref.invalidate(gStateNotifierProvider);
            },
            child: Text('invalidate'),
          )
        ]));
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _state5 = ref.watch(gStateNotifierProvider);
    return Text('State5: $_state5');
  }
}

