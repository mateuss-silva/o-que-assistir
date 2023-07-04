import 'package:mocktail/mocktail.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/movie_repository.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/tv_serie_repository.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

class MockTVSerieRepository extends Mock implements TVSerieRepository {}
