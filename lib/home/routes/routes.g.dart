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
      path: '/base',
      factory: $MainRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'reportContent',
          factory: $ReportContentRouteExtension._fromState,
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => MainRoute();

  String get location => GoRouteData.$location(
        '/base',
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
        '/base/reportContent',
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

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}

RouteBase get $unauthorizedRoute => GoRouteData.$route(
      path: '/unauth',
      factory: $UnauthorizedRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'login',
          factory: $LoginRouteExtension._fromState,
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
  static SearchPageRoute _fromState(GoRouterState state) => SearchPageRoute();

  String get location => GoRouteData.$location(
        '/SearchPage',
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
  static ProfilePageRoute _fromState(GoRouterState state) => ProfilePageRoute();

  String get location => GoRouteData.$location(
        '/ProfilePage',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
