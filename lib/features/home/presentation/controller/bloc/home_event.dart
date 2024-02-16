part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetFactsApiEvent extends HomeEvent {
  final VoidCallback onError;

  const GetFactsApiEvent({required this.onError});
}

class GetFactApiEvent extends HomeEvent {
  const GetFactApiEvent();
}

class AddFactTitleEvent extends HomeEvent {
  final String title;
  const AddFactTitleEvent(this.title);
}


class AddFactTitlesEvent extends HomeEvent {
  final List<String> titles;
  const AddFactTitlesEvent(this.titles);
}
