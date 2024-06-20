import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/future_providers.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonName = ref.watch(pokemonNameProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Future Provider'),
        ),
        body: Center(
          child: pokemonName.when(
            data: (data) => Text(data),
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('$error'),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: 'btn-1',
              child: const Icon(Icons.navigate_before_rounded),
              onPressed: () {
                // ref.invalidate(pokemonNameProvider);
                ref.read(pokemonIdProvider.notifier).prevPokemon();
              },
            ),

            FloatingActionButton(
              heroTag: 'btn-2',
              child: const Icon(Icons.navigate_next_rounded),
              onPressed: () {
                // ref.invalidate(pokemonNameProvider);
                ref.read(pokemonIdProvider.notifier).nextPokemon();
              },
            ),
          ],
        ));
  }
}