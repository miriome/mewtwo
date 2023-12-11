part of 'routes.dart';


class LoginRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginPage();
  }
}

class SelectPronounsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SelectPronounsPage();
  }
}

class SelectStyleRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SelectStylePage();
  }
}

class SignUpRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpPage();
  }
}

class CreateProfileRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CreateProfilePage();
  }
}

class MeasurementsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MeasurementsPage();
  }
}