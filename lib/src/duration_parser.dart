const _numbers = '\\d+(?:[\\.,]\\d{0,3})?';
const _weekPattern = '(${_numbers}W)';
const _datePattern = '(${_numbers}Y)?(${_numbers}M)?(${_numbers}D)?';
const _timePattern = 'T(${_numbers}H)?(${_numbers}M)?(${_numbers}S)?';
const _iso8601 = 'P(?:${_weekPattern}|${_datePattern}(?:${_timePattern})?)';
const _objMap = const [
  'weeks',
  'years',
  'months',
  'days',
  'hours',
  'minutes',
  'seconds'
];

final RegExp _regex = new RegExp(_iso8601);

Duration parse(String durationString) {
  Match match = _regex.firstMatch(durationString);
  final result = {};
  for (int i = 1; i <= match.groupCount; i++) {
    result[_objMap[i - 1]] = _getNum(match.group(i));
  }

  if (result['weeks'] > 0) {
    num days = result['weeks'] * 7;
    return new Duration(days: days);
  }

  num days = (result['years'] * 365) + (result['months'] * 30) + result['days'];
  num hours = result['hours'];
  num minutes = result['minutes'];
  num seconds = result['seconds'];
  return new Duration(
      days: days, hours: hours, minutes: minutes, seconds: seconds);
}

num _getNum(String value) {
  if (value == null) {
    return 0;
  }

  return num.parse(new RegExp(_numbers).firstMatch(value).group(0));
}
