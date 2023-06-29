import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }
}