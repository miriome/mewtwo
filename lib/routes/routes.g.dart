// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainRoute,
      $unauthorizedRoute,
      $mainTabShellRoute,
    ];

RouteBase get $mainRoute => GoRouteData.$route(
      path: '/',
      factory: $MainRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'reportContent',
          parentNavigatorKey: ReportContentRoute.$parentNavigatorKey,
          factory: $ReportContentRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'OtherProfilePage',
          parentNavigatorKey: OtherProfilePageRoute.$parentNavigatorKey,
          factory: $OtherProfilePageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'postDetails',
          parentNavigatorKey: PostDetailsRoute.$parentNavigatorKey,
          factory: $PostDetailsRouteExtension._fromState,
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => MainRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReportContentRouteExtension on ReportContentRoute {
  static ReportContentRoute _fromState(GoRouterState state) =>
      ReportContentRoute(
        reportType: _$ReportTypeEnumMap
            ._$fromName(state.uri.queryParameters['report-type']!),
        typeId: state.uri.queryParameters['type-id']!,
      );

  String get location => GoRouteData.$location(
        '/reportContent',
        queryParams: {
          'report-type': _$ReportTypeEnumMap[reportType],
          'type-id': typeId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$ReportTypeEnumMap = {
  ReportType.post: 'post',
  ReportType.comment: 'comment',
  ReportType.user: 'user',
};

extension $OtherProfilePageRouteExtension on OtherProfilePageRoute {
  static OtherProfilePageRoute _fromState(GoRouterState state) =>
      OtherProfilePageRoute(
        userId: int.parse(state.uri.queryParameters['user-id']!),
      );

  String get location => GoRouteData.$location(
        '/OtherProfilePage',
        queryParams: {
          'user-id': userId.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostDetailsRouteExtension on PostDetailsRoute {
  static PostDetailsRoute _fromState(GoRouterState state) => PostDetailsRoute(
        postId: int.parse(state.uri.queryParameters['post-id']!),
        isFromApp: _$convertMapValue(
                'is-from-app', state.uri.queryParameters, _$boolConverter) ??
            false,
      );

  String get location => GoRouteData.$location(
        '/postDetails',
        queryParams: {
          'post-id': postId.toString(),
          if (isFromApp != false) 'is-from-app': isFromApp.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $unauthorizedRoute => GoRouteData.$route(
      path: '/unauth',
      factory: $UnauthorizedRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'login',
          factory: $LoginRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'select-pronouns',
          factory: $SelectPronounsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'select-style',
          factory: $SelectStyleRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'sign-up',
          factory: $SignUpRouteExtension._fromState,
        ),
      ],
    );

extension $UnauthorizedRouteExtension on UnauthorizedRoute {
  static UnauthorizedRoute _fromState(GoRouterState state) =>
      UnauthorizedRoute();

  String get location => GoRouteData.$location(
        '/unauth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  String get location => GoRouteData.$location(
        '/unauth/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SelectPronounsRouteExtension on SelectPronounsRoute {
  static SelectPronounsRoute _fromState(GoRouterState state) =>
      SelectPronounsRoute();

  String get location => GoRouteData.$location(
        '/unauth/select-pronouns',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SelectStyleRouteExtension on SelectStyleRoute {
  static SelectStyleRoute _fromState(GoRouterState state) => SelectStyleRoute();

  String get location => GoRouteData.$location(
        '/unauth/select-style',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SignUpRouteExtension on SignUpRoute {
  static SignUpRoute _fromState(GoRouterState state) => SignUpRoute();

  String get location => GoRouteData.$location(
        '/unauth/sign-up',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainTabShellRoute => StatefulShellRouteData.$route(
      factory: $MainTabShellRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/HomePage',
              factory: $HomePageRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/SearchPage',
              factory: $SearchPageRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/NewPost',
              factory: $NewPostRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/NotificationPage',
              factory: $NotificationPageRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/ProfilePage',
              factory: $ProfilePageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainTabShellRouteExtension on MainTabShellRoute {
  static MainTabShellRoute _fromState(GoRouterState state) =>
      const MainTabShellRoute();
}

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => HomePageRoute();

  String get location => GoRouteData.$location(
        '/HomePage',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchPageRouteExtension on SearchPageRoute {
  static SearchPageRoute _fromState(GoRouterState state) => SearchPageRoute(
        initialSearchTerm: state.uri.queryParameters['initial-search-term'],
      );

  String get location => GoRouteData.$location(
        '/SearchPage',
        queryParams: {
          if (initialSearchTerm != null)
            'initial-search-term': initialSearchTerm,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewPostRouteExtension on NewPostRoute {
  static NewPostRoute _fromState(GoRouterState state) => NewPostRoute();

  String get location => GoRouteData.$location(
        '/NewPost',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationPageRouteExtension on NotificationPageRoute {
  static NotificationPageRoute _fromState(GoRouterState state) =>
      NotificationPageRoute();

  String get location => GoRouteData.$location(
        '/NotificationPage',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfilePageRouteExtension on ProfilePageRoute {
  static ProfilePageRoute _fromState(GoRouterState state) => ProfilePageRoute(
        userId:
            _$convertMapValue('user-id', state.uri.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/ProfilePage',
        queryParams: {
          if (userId != null) 'user-id': userId!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
