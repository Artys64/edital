import 'dart:io';
import 'package:test/test.dart';
import 'package:edital_server/src/error_logger.dart';
import 'package:serverpod/serverpod.dart';

void main() {
  group('ErrorLogger', () {
    late String testLogDirectory;
    late Session mockSession;

    setUp(() {
      // Create a temporary directory for test logs
      testLogDirectory = Directory.systemTemp.createTempSync('error_logger_test').path;
      ErrorLogger.initialize(logDirectory: testLogDirectory);
      
      // Create a mock session
      mockSession = MockSession();
    });

    tearDown(() {
      // Clean up test log files
      try {
        Directory(testLogDirectory).deleteSync(recursive: true);
      } catch (e) {
        // Ignore cleanup errors
      }
    });

    test('should log error to serverpod_errors.log file', () async {
      const testError = 'Test error message';
      const testContext = 'TestEndpoint.testMethod';
      
      await ErrorLogger.logError(mockSession, testError, context: testContext);
      
      final logFile = File('$testLogDirectory/serverpod_errors.log');
      expect(logFile.existsSync(), isTrue);
      
      final logContent = await logFile.readAsString();
      expect(logContent, contains(testError));
      expect(logContent, contains(testContext));
      expect(logContent, contains('timestamp'));
      expect(logContent, contains('sessionId'));
    });

    test('should log error with metadata', () async {
      const testError = 'Test error with metadata';
      final metadata = {
        'userId': 123,
        'action': 'create_user',
        'ip': '192.168.1.1',
      };
      
      await ErrorLogger.logErrorWithMetadata(mockSession, testError, metadata);
      
      final logFile = File('$testLogDirectory/serverpod_errors.log');
      expect(logFile.existsSync(), isTrue);
      
      final logContent = await logFile.readAsString();
      expect(logContent, contains(testError));
      expect(logContent, contains('userId'));
      expect(logContent, contains('123'));
      expect(logContent, contains('create_user'));
    });

    test('should append multiple error logs', () async {
      await ErrorLogger.logError(mockSession, 'First error', context: 'Test1');
      await ErrorLogger.logError(mockSession, 'Second error', context: 'Test2');
      
      final logFile = File('$testLogDirectory/serverpod_errors.log');
      final logContent = await logFile.readAsString();
      
      expect(logContent, contains('First error'));
      expect(logContent, contains('Second error'));
      expect(logContent.split('\n').where((line) => line.isNotEmpty).length, equals(2));
    });
  });
}

/// Mock session for testing
class MockSession implements Session {
  @override
  String get sessionId => 'test-session-id';

  @override
  void log(String message, {Object? exception, StackTrace? stackTrace}) {
    print('Mock log: $message');
  }

  // Other Session methods - simplified for testing
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}