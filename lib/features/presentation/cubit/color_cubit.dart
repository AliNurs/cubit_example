// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<ColorCubitState> {
  ColorCubit() : super(ColorInitialState(Colors.black));

  changeColor(Color color, double size) async {
    if (color != state.color) {
      emit(ColorLoadingState(color));
      await Future.delayed(const Duration(seconds: 1));
    }
    emit(ColorChangedState(color: color, size: size));
  }
}

abstract class ColorCubitState {
  final Color color;
  ColorCubitState({
    required this.color,
  });
}

class ColorChangedState extends ColorCubitState {
  final Color color;
  final double size;

  ColorChangedState({
    required this.color,
    required this.size,
  }) : super(color: color);
}

class ColorInitialState extends ColorCubitState {
  final Color color;
  ColorInitialState(
    this.color,
  ) : super(color: color);
}

class ColorLoadingState extends ColorCubitState {
  final Color color;
  ColorLoadingState(
    this.color,
  ) : super(color: color);
}
