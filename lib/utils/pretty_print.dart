import 'dart:convert';

void prettyPrintJson(Map<String, dynamic> input) {
  final dynamic jsonValue = json.encode(input);

  const decoder = JsonDecoder();
  const encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(jsonValue);
  final dynamic prettyString = encoder.convert(object);
  // ignore: avoid_dynamic_calls
  prettyString.split('\n').forEach(
        // ignore: avoid_print
        print,
      );
}
