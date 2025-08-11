import 'dart:io';
import 'dart:convert';
import 'package:serverpod/serverpod.dart';

/// Service for logging errors to serverpod_errors.log file
class ErrorLogger {
  static const String _logFileName = 'serverpod_errors.log';
  static late String _logFilePath;
  static bool _initialized = false;

  /// Initialize the error logger with the log file path
  static void initialize({String? logDirectory}) {
    logDirectory ??= Directory.current.path;
    _logFilePath = '$logDirectory/$_logFileName';
    _initialized = true;
  }

  /// Log an error to the serverpod_errors.log file
  static Future<void> logError(
    Session session,
    dynamic error, {
    String? context,
    StackTrace? stackTrace,
  }) async {
    if (!_initialized) {
      initialize();
    }

    try {
      final timestamp = DateTime.now().toUtc().toIso8601String();
      final sessionId = session.sessionId;
      
      final logEntry = {
        'timestamp': timestamp,
        'sessionId': sessionId,
        'context': context ?? 'Unknown',
        'error': error.toString(),
        'stackTrace': stackTrace?.toString(),
      };

      final logLine = '${jsonEncode(logEntry)}\n';
      
      // Append to the log file
      final file = File(_logFilePath);
      await file.writeAsString(logLine, mode: FileMode.append);
      
      // Also log to session for debugging
      session.log('Error logged to $_logFileName: $error');
    } catch (e) {
      // Fallback to session logging if file logging fails
      session.log('Failed to write to error log file: $e');
      session.log('Original error: $error');
    }
  }

  /// Log an error with additional metadata
  static Future<void> logErrorWithMetadata(
    Session session,
    dynamic error,
    Map<String, dynamic> metadata, {
    StackTrace? stackTrace,
  }) async {
    if (!_initialized) {
      initialize();
    }

    try {
      final timestamp = DateTime.now().toUtc().toIso8601String();
      final sessionId = session.sessionId;
      
      final logEntry = {
        'timestamp': timestamp,
        'sessionId': sessionId,
        'error': error.toString(),
        'stackTrace': stackTrace?.toString(),
        'metadata': metadata,
      };

      final logLine = '${jsonEncode(logEntry)}\n';
      
      // Append to the log file
      final file = File(_logFilePath);
      await file.writeAsString(logLine, mode: FileMode.append);
      
      // Also log to session for debugging
      session.log('Error logged to $_logFileName: $error');
    } catch (e) {
      // Fallback to session logging if file logging fails
      session.log('Failed to write to error log file: $e');
      session.log('Original error: $error');
    }
  }

  /// Get the current log file path
  static String get logFilePath => _logFilePath;
}