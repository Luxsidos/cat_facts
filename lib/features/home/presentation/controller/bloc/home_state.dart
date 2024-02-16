part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<FactEntity> factsModel;
  final FormzSubmissionStatus statusFacts;
  final FactEntity factModel;
  final FormzSubmissionStatus statusFact;
  final List<String> factTitles;

  const HomeState({
    this.factsModel = const [],
    this.statusFacts = FormzSubmissionStatus.initial,
    this.factModel = const FactEntity(),
    this.statusFact = FormzSubmissionStatus.initial,
    this.factTitles = const [],
  });

  HomeState copyWith({
    List<FactEntity>? factsModel,
    FormzSubmissionStatus? statusFacts,
    FactEntity? factModel,
    FormzSubmissionStatus? statusFact,
    List<String>? factTitles,
  }) =>
      HomeState(
        factsModel: factsModel ?? this.factsModel,
        statusFacts: statusFacts ?? this.statusFacts,
        factModel: factModel ?? this.factModel,
        statusFact: statusFact ?? this.statusFact,
      );

  @override
  List<Object> get props => [
        factsModel,
        statusFacts,
        factModel,
        statusFact,
        factTitles,
      ];
}
