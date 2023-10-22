part of 'routes.dart';




class ReportContentRoute extends GoRouteData {
  final String typeId;
  final ReportType reportType;

  ReportContentRoute({
    required this.reportType, required this.typeId
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ReportContent(type: reportType, typeId: typeId);
  }
}