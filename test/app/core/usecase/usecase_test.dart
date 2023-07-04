import 'package:flutter_test/flutter_test.dart';
import 'package:o_que_assistir/app/core/usecase/usecase.dart';

void main() {
  
  late NoParams noParams;

  setUp(() {
    noParams = NoParams();
  });


  test('should be a subclass of baseParams', () async {
    expect(noParams, isA<BaseParams>());
  });

  // test equatable
  test('should return true if the props are the same', () async {
    // arrange
    final tNoParams = NoParams();

    // act
    final result = tNoParams == noParams;

    // assert
    expect(result, true);
  });
}