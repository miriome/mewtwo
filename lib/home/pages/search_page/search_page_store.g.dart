// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchPageStore on _SearchPageStore, Store {
  Computed<List<String>>? _$selfStylesComputed;

  @override
  List<String> get selfStyles =>
      (_$selfStylesComputed ??= Computed<List<String>>(() => super.selfStyles,
              name: '_SearchPageStore.selfStyles'))
          .value;

  late final _$searchTermAtom =
      Atom(name: '_SearchPageStore.searchTerm', context: context);

  @override
  String get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  late final _$_currentPageAtom =
      Atom(name: '_SearchPageStore._currentPage', context: context);

  int get currentPage {
    _$_currentPageAtom.reportRead();
    return super._currentPage;
  }

  @override
  int get _currentPage => currentPage;

  @override
  set _currentPage(int value) {
    _$_currentPageAtom.reportWrite(value, super._currentPage, () {
      super._currentPage = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_SearchPageStore._isLoading', context: context);

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

  late final _$_selfUserModelAtom =
      Atom(name: '_SearchPageStore._selfUserModel', context: context);

  UserModel? get selfUserModel {
    _$_selfUserModelAtom.reportRead();
    return super._selfUserModel;
  }

  @override
  UserModel? get _selfUserModel => selfUserModel;

  @override
  set _selfUserModel(UserModel? value) {
    _$_selfUserModelAtom.reportWrite(value, super._selfUserModel, () {
      super._selfUserModel = value;
    });
  }

  late final _$_postResultsAtom =
      Atom(name: '_SearchPageStore._postResults', context: context);

  ObservableList<PostModel> get postResults {
    _$_postResultsAtom.reportRead();
    return super._postResults;
  }

  @override
  ObservableList<PostModel> get _postResults => postResults;

  @override
  set _postResults(ObservableList<PostModel> value) {
    _$_postResultsAtom.reportWrite(value, super._postResults, () {
      super._postResults = value;
    });
  }

  late final _$_userResultsAtom =
      Atom(name: '_SearchPageStore._userResults', context: context);

  ObservableList<UserModel> get userResults {
    _$_userResultsAtom.reportRead();
    return super._userResults;
  }

  @override
  ObservableList<UserModel> get _userResults => userResults;

  @override
  set _userResults(ObservableList<UserModel> value) {
    _$_userResultsAtom.reportWrite(value, super._userResults, () {
      super._userResults = value;
    });
  }

  late final _$_loadSelfUserDataAsyncAction =
      AsyncAction('_SearchPageStore._loadSelfUserData', context: context);

  @override
  Future<void> _loadSelfUserData() {
    return _$_loadSelfUserDataAsyncAction.run(() => super._loadSelfUserData());
  }

  late final _$searchAsyncAction =
      AsyncAction('_SearchPageStore.search', context: context);

  @override
  Future<void> search() {
    return _$searchAsyncAction.run(() => super.search());
  }

  @override
  String toString() {
    return '''
searchTerm: ${searchTerm},
selfStyles: ${selfStyles}
    ''';
  }
}
