import 'package:duration_parser/duration_parser.dart';

main() {
    print(parse('PT32M11S'));
    /// => 0:32:11.000000

    var duration = parse('P1W');
    print(duration.inDays);
    /// => 7
}