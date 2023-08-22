part of 'choose_bloc.dart';

abstract class ChooseEvent {}

class ChoosingFirstImageEvent extends ChooseEvent{
  final ImageGame option1;

  ChoosingFirstImageEvent({required this.option1,});
}

class ChoosingSecondImageEvent extends ChooseEvent{
  final ImageGame option2;

  ChoosingSecondImageEvent({required this.option2});
}

class ResetChoose extends ChooseEvent{}