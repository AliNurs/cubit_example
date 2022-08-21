// ignore_for_file: use_build_context_synchronously

import 'package:cubit_example/features/presentation/cubit/color_cubit.dart';
import 'package:cubit_example/features/presentation/screens/home_screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocConsumer<ColorCubit, ColorCubitState>(
            listener: (context, state) async {
              if (state is ColorChangedState) {
                if (state.color == Colors.amber) {
                  await Future.delayed(Duration(seconds: 1));

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                }
              }
            },
            builder: (context, state) {
              print(state);
              if (state is ColorLoadingState) {
                return CircularProgressIndicator();
              }
              if (state is ColorChangedState) {
                return AnimatedContainer(
                  duration: const Duration(seconds: 0),
                  height: state.size,
                  width: state.size,
                  color: state.color,
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not at all changed'),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ColorCubit>(context)
                          .changeColor(Colors.green, 400);
                    },
                    child: Text('Najimaite Knopka'),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: '1',
              backgroundColor: Colors.red,
              onPressed: () {
                BlocProvider.of<ColorCubit>(context)
                    .changeColor(Colors.red, 100);
              },
            ),
            FloatingActionButton(
              heroTag: '2',
              backgroundColor: Colors.amber,
              onPressed: () {
                BlocProvider.of<ColorCubit>(context)
                    .changeColor(Colors.amber, 300);
              },
            ),
            FloatingActionButton(
              heroTag: '3',
              backgroundColor: Colors.blue,
              onPressed: () {
                BlocProvider.of<ColorCubit>(context)
                    .changeColor(Colors.blue, 200);
              },
            ),
          ],
        ));
  }
}
