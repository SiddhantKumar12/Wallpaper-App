import 'package:equatable/equatable.dart';

import '../../models/photos_response_model.dart';

abstract class GetPhotosState extends Equatable {}

class GetPhotosInitial extends GetPhotosState {
  @override
  List<Object> get props => [];
}

class PhotosSuccessState extends GetPhotosState {
  final PhotosResponseModel photosResponseModel;

  PhotosSuccessState({required this.photosResponseModel});

  @override
  List<Object?> get props => [photosResponseModel];
}

class PhotosErrorState extends GetPhotosState {
  final String message;

  PhotosErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
