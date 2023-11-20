part of 'page_controller_bloc.dart';

@immutable
abstract class PageControllerEvent {
  const PageControllerEvent();
}

class ChangePageEvent extends PageControllerEvent {
  final int index;

  const ChangePageEvent({required this.index});
}
