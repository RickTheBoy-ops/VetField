import 'package:flutter_test/flutter_test.dart';
import 'package:vetfield_flutter/core/utils/polyline.dart';

void main() {
  test('decodePolyline decodes known example', () {
    const encoded = '_p~iF~ps|U_ulLnnqC_mqNvxq`@';
    final points = decodePolyline(encoded);
    expect(points.isNotEmpty, true);
    expect(points.first.latitude.toStringAsFixed(3), '38.500');
    expect(points.first.longitude.toStringAsFixed(3), '-120.200');
  });
}
