import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_controller_event.dart';

part 'page_controller_state.dart';

class PageControllerBloc
    extends Bloc<PageControllerEvent, PageControllerState> {
  PageControllerBloc()
      : super(const PageControllerInitialState(currentIndex: 0)) {
    on<ChangePageEvent>(_onPageChanged);
  }

  void _onPageChanged(ChangePageEvent event, Emitter emit) {
    emit(PageControllerLoadingState(currentIndex: state.currentIndex));

    emit(ChangePageSuccessState(currentIndex: event.index));
  }
}
