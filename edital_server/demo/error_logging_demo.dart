import 'dart:io';
import 'package:edital_server/src/error_logger.dart';

/// Simple demo to show error logging functionality
void main() async {
  print('🚀 Serverpod Error Logging Demo\n');

  // Initialize error logger
  ErrorLogger.initialize();
  print('✅ Error logger initialized');
  print('📁 Log file path: ${ErrorLogger.logFilePath}\n');

  // Create a mock session for demonstration
  final mockSession = DemoSession();

  // Demo 1: Simple error logging
  print('📝 Demo 1: Simple error logging');
  await ErrorLogger.logError(
    mockSession,
    'Database connection failed',
    context: 'UserEndpoint.createUser',
  );
  print('✅ Error logged\n');

  // Demo 2: Error with metadata
  print('📝 Demo 2: Error with metadata');
  await ErrorLogger.logErrorWithMetadata(
    mockSession,
    'Invalid user input',
    {
      'endpoint': 'AuthEndpoint.register',
      'userId': null,
      'requestMethod': 'POST',
      'userAgent': 'Flutter Web App',
      'timestamp': DateTime.now().toIso8601String(),
    },
  );
  print('✅ Error with metadata logged\n');

  // Demo 3: Multiple errors
  print('📝 Demo 3: Multiple errors');
  for (int i = 1; i <= 3; i++) {
    await ErrorLogger.logError(
      mockSession,
      'Test error #$i',
      context: 'DemoEndpoint.method$i',
    );
  }
  print('✅ Multiple errors logged\n');

  // Show log file contents
  final logFile = File(ErrorLogger.logFilePath);
  if (logFile.existsSync()) {
    print('📄 Log file contents:');
    print('━' * 80);
    final contents = await logFile.readAsString();
    print(contents);
    print('━' * 80);
    
    final lines = contents.split('\n').where((line) => line.isNotEmpty);
    print('\n📊 Total error entries: ${lines.length}');
  } else {
    print('❌ Log file not found');
  }
}

/// Simple mock session for demonstration
class DemoSession {
  String get sessionId => 'demo-session-${DateTime.now().millisecondsSinceEpoch}';
  
  void log(String message) {
    print('Session Log: $message');
  }
}