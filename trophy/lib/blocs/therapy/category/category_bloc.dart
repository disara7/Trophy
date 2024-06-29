import 'package:bloc/bloc.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc()
      : super(const CategoryState('assets/julia.png',
            'Julia is here to listen to all you have to say today. Julia is an AI based female persona created as a therapist to listen to your day to day rants. She will provide you with guidance and ideas. Julia can remember what you have said earlier and she will respond based on the analysis. Please note that some responses may be biased or not entirely accurate.')) {
    on<ChangeCategory>((event, emit) {
      if (state.image == 'assets/julia.png') {
        emit(const CategoryState('assets/julian.png',
            'Julian is here to listen to all you have to say today. Julian is an AI based male persona created as a therapist to listen to your day to day rants. He will provide you with guidance and ideas. Julian can remember what you have said earlier and she will respond based on the analysis. Please note that some responses may be biased or not entirely accurate.'));
      } else {
        emit(const CategoryState('assets/julia.png',
            'Julia is here to listen to all you have to say today. Julia is an AI based female persona created as a therapist to listen to your day to day rants. She will provide you with guidance and ideas. Julia can remember what you have said earlier and she will respond based on the analysis. Please note that some responses may be biased or not entirely accurate.'));
      }
    });
  }
}
