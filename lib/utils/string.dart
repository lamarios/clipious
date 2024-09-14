import 'dart:convert';

String encodeBase64(String s) {
  final bytes = utf8.encode(s);
  return base64Encode(bytes);
}
