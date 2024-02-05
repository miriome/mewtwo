// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messageHistoryHash() => r'57adb09bb063d8c93d0d89bb4862af6b6a6e5c05';

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

/// See also [messageHistory].
@ProviderFor(messageHistory)
const messageHistoryProvider = MessageHistoryFamily();

/// See also [messageHistory].
class MessageHistoryFamily extends Family<AsyncValue<List<Message>>> {
  /// See also [messageHistory].
  const MessageHistoryFamily();

  /// See also [messageHistory].
  MessageHistoryProvider call({
    required int targetId,
  }) {
    return MessageHistoryProvider(
      targetId: targetId,
    );
  }

  @override
  MessageHistoryProvider getProviderOverride(
    covariant MessageHistoryProvider provider,
  ) {
    return call(
      targetId: provider.targetId,
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
  String? get name => r'messageHistoryProvider';
}

/// See also [messageHistory].
class MessageHistoryProvider extends AutoDisposeStreamProvider<List<Message>> {
  /// See also [messageHistory].
  MessageHistoryProvider({
    required int targetId,
  }) : this._internal(
          (ref) => messageHistory(
            ref as MessageHistoryRef,
            targetId: targetId,
          ),
          from: messageHistoryProvider,
          name: r'messageHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$messageHistoryHash,
          dependencies: MessageHistoryFamily._dependencies,
          allTransitiveDependencies:
              MessageHistoryFamily._allTransitiveDependencies,
          targetId: targetId,
        );

  MessageHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.targetId,
  }) : super.internal();

  final int targetId;

  @override
  Override overrideWith(
    Stream<List<Message>> Function(MessageHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MessageHistoryProvider._internal(
        (ref) => create(ref as MessageHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        targetId: targetId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Message>> createElement() {
    return _MessageHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessageHistoryProvider && other.targetId == targetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, targetId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MessageHistoryRef on AutoDisposeStreamProviderRef<List<Message>> {
  /// The parameter `targetId` of this provider.
  int get targetId;
}

class _MessageHistoryProviderElement
    extends AutoDisposeStreamProviderElement<List<Message>>
    with MessageHistoryRef {
  _MessageHistoryProviderElement(super.provider);

  @override
  int get targetId => (origin as MessageHistoryProvider).targetId;
}

String _$conversationUsersHash() => r'a2d685809a1102600027c08e7835e4805c42a67f';

/// See also [conversationUsers].
@ProviderFor(conversationUsers)
const conversationUsersProvider = ConversationUsersFamily();

/// See also [conversationUsers].
class ConversationUsersFamily
    extends Family<AsyncValue<({UserModel reciever, UserModel sender})>> {
  /// See also [conversationUsers].
  const ConversationUsersFamily();

  /// See also [conversationUsers].
  ConversationUsersProvider call({
    required int senderId,
    required int receiverId,
  }) {
    return ConversationUsersProvider(
      senderId: senderId,
      receiverId: receiverId,
    );
  }

  @override
  ConversationUsersProvider getProviderOverride(
    covariant ConversationUsersProvider provider,
  ) {
    return call(
      senderId: provider.senderId,
      receiverId: provider.receiverId,
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
  String? get name => r'conversationUsersProvider';
}

/// See also [conversationUsers].
class ConversationUsersProvider extends AutoDisposeFutureProvider<
    ({UserModel reciever, UserModel sender})> {
  /// See also [conversationUsers].
  ConversationUsersProvider({
    required int senderId,
    required int receiverId,
  }) : this._internal(
          (ref) => conversationUsers(
            ref as ConversationUsersRef,
            senderId: senderId,
            receiverId: receiverId,
          ),
          from: conversationUsersProvider,
          name: r'conversationUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$conversationUsersHash,
          dependencies: ConversationUsersFamily._dependencies,
          allTransitiveDependencies:
              ConversationUsersFamily._allTransitiveDependencies,
          senderId: senderId,
          receiverId: receiverId,
        );

  ConversationUsersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.senderId,
    required this.receiverId,
  }) : super.internal();

  final int senderId;
  final int receiverId;

  @override
  Override overrideWith(
    FutureOr<({UserModel reciever, UserModel sender})> Function(
            ConversationUsersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConversationUsersProvider._internal(
        (ref) => create(ref as ConversationUsersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        senderId: senderId,
        receiverId: receiverId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<({UserModel reciever, UserModel sender})>
      createElement() {
    return _ConversationUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConversationUsersProvider &&
        other.senderId == senderId &&
        other.receiverId == receiverId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, senderId.hashCode);
    hash = _SystemHash.combine(hash, receiverId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ConversationUsersRef
    on AutoDisposeFutureProviderRef<({UserModel reciever, UserModel sender})> {
  /// The parameter `senderId` of this provider.
  int get senderId;

  /// The parameter `receiverId` of this provider.
  int get receiverId;
}

class _ConversationUsersProviderElement
    extends AutoDisposeFutureProviderElement<
        ({UserModel reciever, UserModel sender})> with ConversationUsersRef {
  _ConversationUsersProviderElement(super.provider);

  @override
  int get senderId => (origin as ConversationUsersProvider).senderId;
  @override
  int get receiverId => (origin as ConversationUsersProvider).receiverId;
}

String _$sendMessageHash() => r'b8f904f66c35a800988c8ca2f43591de0cdd4467';

/// See also [sendMessage].
@ProviderFor(sendMessage)
const sendMessageProvider = SendMessageFamily();

/// See also [sendMessage].
class SendMessageFamily extends Family<AsyncValue<void>> {
  /// See also [sendMessage].
  const SendMessageFamily();

  /// See also [sendMessage].
  SendMessageProvider call({
    required int senderId,
    required int receiverId,
    required String message,
  }) {
    return SendMessageProvider(
      senderId: senderId,
      receiverId: receiverId,
      message: message,
    );
  }

  @override
  SendMessageProvider getProviderOverride(
    covariant SendMessageProvider provider,
  ) {
    return call(
      senderId: provider.senderId,
      receiverId: provider.receiverId,
      message: provider.message,
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
  String? get name => r'sendMessageProvider';
}

/// See also [sendMessage].
class SendMessageProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendMessage].
  SendMessageProvider({
    required int senderId,
    required int receiverId,
    required String message,
  }) : this._internal(
          (ref) => sendMessage(
            ref as SendMessageRef,
            senderId: senderId,
            receiverId: receiverId,
            message: message,
          ),
          from: sendMessageProvider,
          name: r'sendMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendMessageHash,
          dependencies: SendMessageFamily._dependencies,
          allTransitiveDependencies:
              SendMessageFamily._allTransitiveDependencies,
          senderId: senderId,
          receiverId: receiverId,
          message: message,
        );

  SendMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.senderId,
    required this.receiverId,
    required this.message,
  }) : super.internal();

  final int senderId;
  final int receiverId;
  final String message;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendMessageProvider._internal(
        (ref) => create(ref as SendMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        senderId: senderId,
        receiverId: receiverId,
        message: message,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendMessageProvider &&
        other.senderId == senderId &&
        other.receiverId == receiverId &&
        other.message == message;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, senderId.hashCode);
    hash = _SystemHash.combine(hash, receiverId.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendMessageRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `senderId` of this provider.
  int get senderId;

  /// The parameter `receiverId` of this provider.
  int get receiverId;

  /// The parameter `message` of this provider.
  String get message;
}

class _SendMessageProviderElement extends AutoDisposeFutureProviderElement<void>
    with SendMessageRef {
  _SendMessageProviderElement(super.provider);

  @override
  int get senderId => (origin as SendMessageProvider).senderId;
  @override
  int get receiverId => (origin as SendMessageProvider).receiverId;
  @override
  String get message => (origin as SendMessageProvider).message;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
