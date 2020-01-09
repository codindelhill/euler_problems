import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'assets/triangle.txt';z

main() {
  var path = "assets/triangle";
  new File(path)
    .openRead()
    .transform(utf8.decoder)
    .transform(new LineSplitter())
    .forEach((l) => print('line: $l'));
}
