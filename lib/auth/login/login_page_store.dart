import 'package:flutter/material.dart';
import 'package:mewtwo/auth/api/api.dart';
import 'package:mewtwo/mew.dart';
import 'package:mobx/mobx.dart';

part 'login_page_store.g.dart';

class LoginPageStore extends _LoginPageStore with _$LoginPageStore {}

abstract class _LoginPageStore with Store {
  @readonly
  TextEditingController _usernameController = TextEditingController();

  @readonly
  TextEditingController _passwordController = TextEditingController();

  @observable
  bool isPasswordHidden = true;

  @readonly
  bool _isLoading = false;

  @action
  Future<void> login() async {
    final loginProvider = LoginApiProvider(username: _usernameController.text, password: _passwordController.text);
    final listener = Mew.pc.listen(loginProvider, (previous, next) { 
      _isLoading = next.isLoading;
    });
    await Mew.pc.read(loginProvider.future);
    listener.close();
  }

  
}