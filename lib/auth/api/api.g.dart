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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
