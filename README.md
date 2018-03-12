# duration_parser

Module for parsing ISO 8601 durations.

## Parse Duration

Use `parse` to get a `Duration` from an ISO 8601 string. Check out the details on [Wikipedia](https://en.wikipedia.org/wiki/ISO_8601#Durations)

```dart
import 'package:duration_parser/duration_parser.dart';

main() {
    print(parse('PT32M11S'));
    /// => 0:32:11.000000

    var duration = parse('P1W');
    print(duration.inDays);
    /// => 7
}
```