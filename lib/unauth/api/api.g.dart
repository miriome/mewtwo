// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginApiHash() => r'c2ebbf8fef74d938b6434c94aee3547af38f6f4d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [loginApi].
@ProviderFor(loginApi)
const loginApiProvider = LoginApiFamily();

/// See also [loginApi].
class LoginApiFamily extends Family<AsyncValue<void>> {
  /// See also [loginApi].
  const LoginApiFamily();

  /// See also [loginApi].
  LoginApiProvider call({
    required String username,
    required String password,
  }) {
    return LoginApiProvider(
      username: username,
      password: password,
    );
  }

  @override
  LoginApiProvider getProviderOverride(
    covariant LoginApiProvider provider,
  ) {
    return call(
      username: provider.username,
      password: provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loginApiProvider';
}

/// See also [loginApi].
class LoginApiProvider extends AutoDisposeFutureProvider<void> {
  /// See also [loginApi].
  LoginApiProvider({
    required String username,
    required String password,
  }) : this._internal(
          (ref) => loginApi(
            ref as LoginApiRef,
            username: username,
            password: password,
          ),
          from: loginApiProvider,
          name: r'loginApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginApiHash,
          dependencies: LoginApiFamily._dependencies,
          allTransitiveDependencies: LoginApiFamily._allTransitiveDependencies,
          username: username,
          password: password,
        );

  LoginApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.password,
  }) : super.internal();

  final String username;
  final String password;

  @override
  Override overrideWith(
    FutureOr<void> Function(LoginApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginApiProvider._internal(
        (ref) => create(ref as LoginApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _LoginApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginApiProvider &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginApiRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `password` of this provider.
  String get password;
}

class _LoginApiProviderElement extends AutoDisposeFutureProviderElement<void>
    with LoginApiRef {
  _LoginApiProviderElement(super.provider);

  @override
  String get username => (origin as LoginApiProvider).username;
  @override
  String get password => (origin as LoginApiProvider).password;
}

String _$checkAccountFieldExistApiHash() =>
    r'386ea7ff8d2bbbbc5e209c54ff7cfbd1f650eb1b';

/// See also [checkAccountFieldExistApi].
@ProviderFor(checkAccountFieldExistApi)
const checkAccountFieldExistApiProvider = CheckAccountFieldExistApiFamily();

/// See also [checkAccountFieldExistApi].
class CheckAccountFieldExistApiFamily extends Family<AsyncValue<bool?>> {
  /// See also [checkAccountFieldExistApi].
  const CheckAccountFieldExistApiFamily();

  /// See also [checkAccountFieldExistApi].
  CheckAccountFieldExistApiProvider call({
    required ExistingAccountFieldKey key,
    required String value,
  }) {
    return CheckAccountFieldExistApiProvider(
      key: key,
      value: value,
    );
  }

  @override
  CheckAccountFieldExistApiProvider getProviderOverride(
    covariant CheckAccountFieldExistApiProvider provider,
  ) {
    return call(
      key: provider.key,
      value: provider.value,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'checkAccountFieldExistApiProvider';
}

/// See also [checkAccountFieldExistApi].
class CheckAccountFieldExistApiProvider
    extends AutoDisposeFutureProvider<bool?> {
  /// See also [checkAccountFieldExistApi].
  CheckAccountFieldExistApiProvider({
    required ExistingAccountFieldKey key,
    required String value,
  }) : this._internal(
          (ref) => checkAccountFieldExistApi(
            ref as CheckAccountFieldExistApiRef,
            key: key,
            value: value,
          ),
          from: checkAccountFieldExistApiProvider,
          name: r'checkAccountFieldExistApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkAccountFieldExistApiHash,
          dependencies: CheckAccountFieldExistApiFamily._dependencies,
          allTransitiveDependencies:
              CheckAccountFieldExistApiFamily._allTransitiveDependencies,
          key: key,
          value: value,
        );

  CheckAccountFieldExistApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
    required this.value,
  }) : super.internal();

  final ExistingAccountFieldKey key;
  final String value;

  @override
  Override overrideWith(
    FutureOr<bool?> Function(CheckAccountFieldExistApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckAccountFieldExistApiProvider._internal(
        (ref) => create(ref as CheckAccountFieldExistApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
        value: value,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool?> createElement() {
    return _CheckAccountFieldExistApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckAccountFieldExistApiProvider &&
        other.key == key &&
        other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CheckAccountFieldExistApiRef on AutoDisposeFutureProviderRef<bool?> {
  /// The parameter `key` of this provider.
  ExistingAccountFieldKey get key;

  /// The parameter `value` of this provider.
  String get value;
}

class _CheckAccountFieldExistApiProviderElement
    extends AutoDisposeFutureProviderElement<bool?>
    with CheckAccountFieldExistApiRef {
  _CheckAccountFieldExistApiProviderElement(super.provider);

  @override
  ExistingAccountFieldKey get key =>
      (origin as CheckAccountFieldExistApiProvider).key;
  @override
  String get value => (origin as CheckAccountFieldExistApiProvider).value;
}

String _$signUpApiHash() => r'0cb971489a7d8aa4b9ae299306ab10927a88a9db';

/// See also [signUpApi].
@ProviderFor(signUpApi)
const signUpApiProvider = SignUpApiFamily();

/// See also [signUpApi].
class SignUpApiFamily extends Family<AsyncValue<bool>> {
  /// See also [signUpApi].
  const SignUpApiFamily();

  /// See also [signUpApi].
  SignUpApiProvider call({
    required String username,
    required String email,
    required String password,
  }) {
    return SignUpApiProvider(
      username: username,
      email: email,
      password: password,
    );
  }

  @override
  SignUpApiProvider getProviderOverride(
    covariant SignUpApiProvider provider,
  ) {
    return call(
      username: provider.username,
      email: provider.email,
      password: provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signUpApiProvider';
}

/// See also [signUpApi].
class SignUpApiProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [signUpApi].
  SignUpApiProvider({
    required String username,
    required String email,
    required String password,
  }) : this._internal(
          (ref) => signUpApi(
            ref as SignUpApiRef,
            username: username,
            email: email,
            password: password,
          ),
          from: signUpApiProvider,
          name: r'signUpApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signUpApiHash,
          dependencies: SignUpApiFamily._dependencies,
          allTransitiveDependencies: SignUpApiFamily._allTransitiveDependencies,
          username: username,
          email: email,
          password: password,
        );

  SignUpApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.email,
    required this.password,
  }) : super.internal();

  final String username;
  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SignUpApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignUpApiProvider._internal(
        (ref) => create(ref as SignUpApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SignUpApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpApiProvider &&
        other.username == username &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignUpApiRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _SignUpApiProviderElement extends AutoDisposeFutureProviderElement<bool>
    with SignUpApiRef {
  _SignUpApiProviderElement(super.provider);

  @override
  String get username => (origin as SignUpApiProvider).username;
  @override
  String get email => (origin as SignUpApiProvider).email;
  @override
  String get password => (origin as SignUpApiProvider).password;
}

String _$editProfileApiHash() => r'f4f7fa9e74472eb6bdcad11388999876e1dd2196';

/// See also [editProfileApi].
@ProviderFor(editProfileApi)
const editProfileApiProvider = EditProfileApiFamily();

/// See also [editProfileApi].
class EditProfileApiFamily extends Family<AsyncValue<bool>> {
  /// See also [editProfileApi].
  const EditProfileApiFamily();

  /// See also [editProfileApi].
  EditProfileApiProvider call({
    required String displayName,
    List<int>? fileBytes,
    bool isDeletePhoto = false,
  }) {
    return EditProfileApiProvider(
      displayName: displayName,
      fileBytes: fileBytes,
      isDeletePhoto: isDeletePhoto,
    );
  }

  @override
  EditProfileApiProvider getProviderOverride(
    covariant EditProfileApiProvider provider,
  ) {
    return call(
      displayName: provider.displayName,
      fileBytes: provider.fileBytes,
      isDeletePhoto: provider.isDeletePhoto,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'editProfileApiProvider';
}

/// See also [editProfileApi].
class EditProfileApiProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [editProfileApi].
  EditProfileApiProvider({
    required String displayName,
    List<int>? fileBytes,
    bool isDeletePhoto = false,
  }) : this._internal(
          (ref) => editProfileApi(
            ref as EditProfileApiRef,
            displayName: displayName,
            fileBytes: fileBytes,
            isDeletePhoto: isDeletePhoto,
          ),
          from: editProfileApiProvider,
          name: r'editProfileApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editProfileApiHash,
          dependencies: EditProfileApiFamily._dependencies,
          allTransitiveDependencies:
              EditProfileApiFamily._allTransitiveDependencies,
          displayName: displayName,
          fileBytes: fileBytes,
          isDeletePhoto: isDeletePhoto,
        );

  EditProfileApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.displayName,
    required this.fileBytes,
    required this.isDeletePhoto,
  }) : super.internal();

  final String displayName;
  final List<int>? fileBytes;
  final bool isDeletePhoto;

  @override
  Override overrideWith(
    FutureOr<bool> Function(EditProfileApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EditProfileApiProvider._internal(
        (ref) => create(ref as EditProfileApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        displayName: displayName,
        fileBytes: fileBytes,
        isDeletePhoto: isDeletePhoto,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _EditProfileApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditProfileApiProvider &&
        other.displayName == displayName &&
        other.fileBytes == fileBytes &&
        other.isDeletePhoto == isDeletePhoto;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, displayName.hashCode);
    hash = _SystemHash.combine(hash, fileBytes.hashCode);
    hash = _SystemHash.combine(hash, isDeletePhoto.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditProfileApiRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `displayName` of this provider.
  String get displayName;

  /// The parameter `fileBytes` of this provider.
  List<int>? get fileBytes;

  /// The parameter `isDeletePhoto` of this provider.
  bool get isDeletePhoto;
}

class _EditProfileApiProviderElement
    extends AutoDisposeFutureProviderElement<bool> with EditProfileApiRef {
  _EditProfileApiProviderElement(super.provider);

  @override
  String get displayName => (origin as EditProfileApiProvider).displayName;
  @override
  List<int>? get fileBytes => (origin as EditProfileApiProvider).fileBytes;
  @override
  bool get isDeletePhoto => (origin as EditProfileApiProvider).isDeletePhoto;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
