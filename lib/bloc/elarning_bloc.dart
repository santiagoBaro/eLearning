import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/data_types/couse_element_dataType.dart';
import 'package:equatable/equatable.dart';

part 'elarning_event.dart';
part 'elarning_state.dart';

class ElarningBloc extends Bloc<ElarningEvent, ElarningState> {
  ElarningBloc() : super(ElarningInitial());

  @override
  Stream<ElarningState> mapEventToState(
    ElarningEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
