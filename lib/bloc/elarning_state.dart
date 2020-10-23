part of 'elarning_bloc.dart';

abstract class ElarningState extends Equatable {
  const ElarningState();

  @override
  List<Object> get props => [];
}

class ElarningInitial extends ElarningState {}

class LoginState extends ElarningState {}

class HomeState extends ElarningState {
  final List<Course> courses;

  HomeState(this.courses);
}

class CourseState extends ElarningState {}

class ContentState extends ElarningState {}

class MessageListState extends ElarningState {}

class MessageDetailState extends ElarningState {}

class EnrollmentState extends ElarningState {}

class InformationState extends ElarningState {}
