import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:task_cat/core/usecases/usecase.dart';
import 'package:task_cat/features/home/domain/entity/fact_entity.dart';
import 'package:task_cat/features/home/domain/usecase/fact_usecase.dart';
import 'package:task_cat/features/home/domain/usecase/facts_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final usecase = FactsUseCase();
  final factUsecase = FactUseCase();

  HomeBloc() : super(const HomeState()) {
    on<GetFactsApiEvent>((event, emit) async {
      emit(state.copyWith(statusFacts: FormzSubmissionStatus.initial));

      final result = await usecase.call(NoParams());

      if (result.isRight) {
        emit(state.copyWith(
          factsModel: result.right,
          statusFacts: FormzSubmissionStatus.success,
        ));
      } else {
        event.onError();
        emit(state.copyWith(statusFacts: FormzSubmissionStatus.failure));
      }
    });

    on<GetFactApiEvent>((event, emit) async {
      emit(state.copyWith(statusFact: FormzSubmissionStatus.initial));

      final result = await factUsecase.call(NoParams());

      if (result.isRight) {
        emit(state.copyWith(
          factModel: result.right,
          statusFact: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(statusFact: FormzSubmissionStatus.failure));
      }
    });

    on<AddFactTitleEvent>((event, emit) {
      emit(state.copyWith(factTitles: [...state.factTitles, event.title]));
    });

    on<AddFactTitlesEvent>((event, emit) {
      emit(state.copyWith(factTitles: event.titles));
    });
  }
}
