import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_post_page_store.g.dart';

@riverpod
NewPostPageStore newPostPageStore(NewPostPageStoreRef ref) {
  final store = NewPostPageStore();
  ref.onDispose(() {
    store.dispose();
  });
  return store;
}

class NewPostPageStore extends _NewPostPageStore with _$NewPostPageStore {}

abstract class _NewPostPageStore with Store {
  @observable
  String displayImagePath = "";

  final controller = TextEditingController();

  void dispose() {
    controller.dispose();
  }
}