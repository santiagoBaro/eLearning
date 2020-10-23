part of 'elarning_bloc.dart';

abstract class ElarningEvent extends Equatable {
  const ElarningEvent();

  @override
  List<Object> get props => [];
}

class LoginRegisterEvent extends ElarningEvent {}

class RegisterEvent extends ElarningEvent {}

class LogoutEvent extends ElarningEvent {}

// class Event extends ElarningEvent {}

class ViewCourseEvent extends ElarningEvent {}

class ViewContentEvent extends ElarningEvent {}

class ViewMessageEvent extends ElarningEvent {}

class ViewEnrollmentsEvent extends ElarningEvent {}

class ViewInquiriesEvent extends ElarningEvent {}
