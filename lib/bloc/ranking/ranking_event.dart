part of 'ranking_bloc.dart';

abstract class RankingEvent {}

class LoadingRankingEvent extends RankingEvent {
  LoadingRankingEvent();
}