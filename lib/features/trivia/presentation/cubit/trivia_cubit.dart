import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'trivia_state.dart';

class TriviaCubit extends Cubit<TriviaState> {
  TriviaCubit() : super(TriviaInitial());
}
