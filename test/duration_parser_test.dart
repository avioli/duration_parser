import 'package:test/test.dart';

import 'package:duration_parser/duration_parser.dart';

void main() {
  group('parse date-time', () {
    test('year', () {
      final duration = parse('P1YT1H1M1S');
      expect(duration.inDays, 365);
    });
    test('month', () {
      final duration = parse('P1M');
      expect(duration.inDays, 30);
    });
    test('week', () {
      final duration = parse('P1W');
      expect(duration.inDays, 7);
    });
    test('day', () {
      final duration = parse('P1D');
      expect(duration.inDays, 1);
    });
    test('hour', () {
      final duration = parse('PT1H');
      expect(duration.inHours, 1);
    });
    test('minutes', () {
      final duration = parse('PT1M');
      expect(duration.inMinutes, 1);
    });
    test('seconds', () {
      final duration = parse('PT1S');
      expect(duration.inSeconds, 1);
    });
    test('invalid', () {
      final duration = parse('PTAS');
      expect(duration.inSeconds, 0);
    });
  });
}
