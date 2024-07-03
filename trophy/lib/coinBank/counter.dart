import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/coinbank/counter_bloc.dart';
import '../blocs/coinbank/counter_state.dart'; // Ensure this import is correct

class Counter extends StatelessWidget {
  const Counter({super.key, required int count});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Container(
          height: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/countbg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Coin.png',
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 13),
              Text(
                '${state.count}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
