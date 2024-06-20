import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';


@Riverpod(keepAlive: true)
class Counter extends _$Counter {

  @override
  int build() => 5;

  void increaseByOne() {
    state++;
  }
}


@Riverpod(keepAlive: true)
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;

  void toggleDarkMode() {
    state = !state;
  }
}


@Riverpod(keepAlive: true)
class Username extends _$Username {
  @override
  String build() => 'Gricelda Valdez';

  void changeName( String name ) {
    state = name;
  }
}