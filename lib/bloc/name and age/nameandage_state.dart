part of 'nameandage_bloc.dart';

@immutable
abstract class NameandageState {
  final String name;
  final int age;
  const NameandageState(this.name, this.age);
}

class NameandageInitial extends NameandageState {
  const NameandageInitial() : super("no name", 0);
}

class NameandageLoaded extends NameandageState {
  const NameandageLoaded({required String name, required int age})
      : super(name, age);
}
