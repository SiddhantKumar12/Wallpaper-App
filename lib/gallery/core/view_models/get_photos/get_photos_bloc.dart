import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/photos_response_model.dart';
import '../../repositories/photos_repository.dart';
import 'get_photos_event.dart';
import 'get_photos_state.dart';

class GetPhotosBloc extends Bloc<GetPhotosEvent, GetPhotosState> {
  late PhotosRepository photosRepository;

  GetPhotosBloc({required this.photosRepository}) : super(GetPhotosInitial()) {
    on<GetPhotos>((event, emit) async {
      emit(GetPhotosInitial());
      try {
        PhotosResponseModel photosResponseModel = await photosRepository.getPhotos();

        emit(PhotosSuccessState(photosResponseModel: photosResponseModel));
      } catch (e) {
        emit(PhotosErrorState(message: e.toString()));
      }
    });
    on<SearchPhotos>((event, emit) async {
      emit(GetPhotosInitial());
      try {
        PhotosResponseModel photosResponseModel = await photosRepository.searchPhotos(event.query);

        emit(PhotosSuccessState(photosResponseModel: photosResponseModel));
      } catch (e) {
        emit(PhotosErrorState(message: e.toString()));
      }
    });
  }
}
