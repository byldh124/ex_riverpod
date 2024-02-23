import 'package:ex_riverpod/layout/default_layout.dart';
import 'package:ex_riverpod/screen/future_provider_screen.dart';
import 'package:ex_riverpod/screen/state_notifier_provider_screen.dart';
import 'package:ex_riverpod/screen/state_provider_screen.dart';
import 'package:ex_riverpod/screen/stream_provider_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'HomeScreen',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (builder) => StateProviderScreen(),
              ));
            },
            child: Text('StateProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (builder) => StateNotifierProviderScreen(),
              ));
            },
            child: Text('StateNotifierProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (builder) => FutureProviderScreen(),
              ));
            },
            child: Text('FutureProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (builder) => StreamProviderScreen(),
              ));
            },
            child: Text('StreamProviderScreen'),
          )
        ],
      ),
    );
  }
}
