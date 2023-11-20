part of 'page_controller_bloc.dart';

@immutable
abstract class PageControllerState {
  final int currentIndex;

  const PageControllerState({required this.currentIndex});
}

class PageControllerInitialState extends PageControllerState {
  const PageControllerInitialState({required super.currentIndex});
}

class PageControllerLoadingState extends PageControllerState {
  const PageControllerLoadingState({required super.currentIndex});
}

class PageControllerFailureState extends PageControllerState {
  final String message;

  const PageControllerFailureState(this.message, {required super.currentIndex});
}

class ChangePageSuccessState extends PageControllerState {
  const ChangePageSuccessState({required super.currentIndex});
}
