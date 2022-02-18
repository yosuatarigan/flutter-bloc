part of 'nameandage_bloc.dart';

@immutable
abstract class NameandageEvent {}

class IncrementAgeEvent extends NameandageEvent {
  final int age;
  IncrementAgeEvent({this.age = 1});
}

class ChangeNameEvent extends NameandageEvent {
  final String name;
  ChangeNameEvent({required this.name});
}

class ChangenameageEvent extends NameandageEvent {
  final String name;
  final int age;
  ChangenameageEvent({required this.name, required this.age});
}
