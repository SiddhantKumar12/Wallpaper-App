import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'gallery/core/repositories/photos_repository.dart';
import 'gallery/core/view_models/get_photos/get_photos_bloc.dart';
import 'gallery/ui/views/gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RepositoryProvider(
        create: (context) => PhotosRepository(),
        child: BlocProvider(
          create: (context) => GetPhotosBloc(photosRepository: RepositoryProvider.of<PhotosRepository>(context)),
          child: const GalleryScreen(),
        ),
      ),
    );
  }
}
