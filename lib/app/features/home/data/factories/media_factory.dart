import 'package:o_que_assistir/app/core/common/types.dart';
import 'package:o_que_assistir/app/features/home/data/models/movie_model.dart';
import 'package:o_que_assistir/app/features/home/data/models/tv_serie_model.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/media_entity.dart';

typedef MediaResult = ({MediaType type, Json data});

abstract interface class MediaFactory {
  MediaEntity fromType(MediaResult media);
}

class MediaFactoryImpl implements MediaFactory {
  @override
  MediaEntity fromType(MediaResult media) {
    switch (media.type) {
      case MediaType.movie:
        return MovieModel.fromJson(media.data);
      case MediaType.tv:
        return TVSerieModel.fromJson(media.data);
      case MediaType.person:
      default:
        throw Exception('Invalid media type');
    }
  }
}
