import 'dart:typed_data';
import 'dart:convert';
import 'package:redux_persist/redux_persist.dart';

class MyJsonSerializer<T> implements StateSerializer<T> {
  final T Function(Map<String, dynamic> json) decoder;

  MyJsonSerializer(this.decoder);

  @override
  T decode(Uint8List data) {
    return decoder(data != null ? json.decode(uint8ListToString(data)) : null);
  }

  @override
  Uint8List encode(T state) {
    if (state == null) {
      return null;
    }

    return stringToUint8List(jsonEncode(state));
  }
}