import 'package:flutter/material.dart';
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
  
}