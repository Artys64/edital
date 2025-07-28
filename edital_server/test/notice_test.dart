import 'package:test/test.dart';
import 'package:edital_server/src/generated/protocol.dart';

void main() {
  group('Notice Type Tests', () {
    test('Notice can be created with required fields', () {
      final notice = Notice(
        title: 'Test Notice',
        content: 'This is a test notice',
        createdAt: DateTime.now(),
      );

      expect(notice.title, equals('Test Notice'));
      expect(notice.content, equals('This is a test notice'));
      expect(notice.id, isNull); // id should be null for new notices
    });

    test('Notice copyWith works correctly', () {
      final notice = Notice(
        title: 'Original Title',
        content: 'Original Content',
        createdAt: DateTime.now(),
      );

      final updatedNotice = notice.copyWith(
        title: 'Updated Title',
        updatedAt: DateTime.now(),
      );

      expect(updatedNotice.title, equals('Updated Title'));
      expect(updatedNotice.content, equals('Original Content')); // unchanged
      expect(updatedNotice.updatedAt, isNotNull);
    });

    test('Notice serialization works correctly', () {
      final createdAt = DateTime.now();
      final notice = Notice(
        id: 1,
        title: 'Test Notice',
        content: 'This is a test notice',
        createdAt: createdAt,
      );

      final json = notice.toJson();
      final deserializedNotice = Notice.fromJson(json);

      expect(deserializedNotice.id, equals(1));
      expect(deserializedNotice.title, equals('Test Notice'));
      expect(deserializedNotice.content, equals('This is a test notice'));
      expect(deserializedNotice.createdAt, equals(createdAt));
    });
  });
}