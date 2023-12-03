// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfilePageStore on _ProfilePageStore, Store {
  Computed<int>? _$likesComputed;

  @override
  int get likes => (_$likesComputed ??=
          Computed<int>(() => super.likes, name: '_ProfilePageStore.likes'))
      .value;
  Computed<List<PostModel>>? _$postsComputed;

  @override
  List<PostModel> get posts =>
      (_$postsComputed ??= Computed<List<PostModel>>(() => super.posts,
              name: '_ProfilePageStore.posts'))
          .value;
  Computed<int>? _$followersComputed;

  @override
  int get followers =>
      (_$followersComputed ??= Computed<int>(() => super.followers,
              name: '_ProfilePageStore.followers'))
          .value;
  Computed<bool>? _$isOwnProfileComputed;

  @override
  bool get isOwnProfile =>
      (_$isOwnProfileComputed ??= Computed<bool>(() => super.isOwnProfile,
              name: '_ProfilePageStore.isOwnProfile'))
          .value;

  late final _$_selfUserIdAtom =
      Atom(name: '_ProfilePageStore._selfUserId', context: context);

  @override
  int? get _selfUserId {
    _$_selfUserIdAtom.reportRead();
    return super._selfUserId;
  }

  @override
  set _selfUserId(int? value) {
    _$_selfUserIdAtom.reportWrite(value, super._selfUserId, () {
      super._selfUserId = value;
    });
  }

  late final _$_userAtom =
      Atom(name: '_ProfilePageStore._user', context: context);

  UserModel? get user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  UserModel? get _user => user;

  @override
  set _user(UserModel? value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_ProfilePageStore._isLoading', context: context);

  bool get isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  bool get _isLoading => isLoading;

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('_ProfilePageStore.load', context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$blockUserAsyncAction =
      AsyncAction('_ProfilePageStore.blockUser', context: context);

  @override
  Future<bool> blockUser() {
    return _$blockUserAsyncAction.run(() => super.blockUser());
  }

  @override
  String toString() {
    return '''
likes: ${likes},
posts: ${posts},
followers: ${followers},
isOwnProfile: ${isOwnProfile}
    ''';
  }
}
