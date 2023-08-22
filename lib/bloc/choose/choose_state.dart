part of 'choose_bloc.dart';

abstract class ChooseState extends Equatable {}

class UnChooseState extends ChooseState{
  @override
  List<Object?> get props => [];
}

class InFirstChooseState extends ChooseState{
  final ImageGame option1;

  InFirstChooseState({required this.option1,});

  @override
  List<Object?> get props => [option1,];
}

class InChooseState extends ChooseState{
  final ImageGame option1;
  final ImageGame option2;
  final bool comparison;

  InChooseState({required this.option1, required this.option2, required this.comparison});

  @override
  List<Object?> get props => [option1, option2, comparison];
}