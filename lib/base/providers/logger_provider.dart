import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';
part 'logger_provider.g.dart';

@Riverpod(keepAlive: true)
Logger logger(LoggerRef ref) {
  final Logger logger = Logger();
  return logger;
}
