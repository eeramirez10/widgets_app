import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/is_dark_provider.dart';

class CouterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CouterScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    final counterValue = ref.watch(counterProvider);
    final isDark = ref.watch(isDarkProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(isDarkProvider.notifier).update((state) => !state);
            }, 
            icon:Icon( !isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined)
          )
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            verticalDirection: VerticalDirection.up,
            children: [
              Text(
                'Valor: $counterValue',
                style: titleLarge,
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
