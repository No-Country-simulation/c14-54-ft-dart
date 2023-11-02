import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/auth/domain/domain.dart';
import 'package:gestion_inventario/features/auth/infrastructure/infrastructure.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/auth_providers/auth_provider.dart';
import 'package:gestion_inventario/features/shared/infrastructure/services/services.dart';
import 'package:image_picker/image_picker.dart';

final productPhotoProvider =
    StateNotifierProvider.autoDispose<ImageNotifier, SelectImage>((ref) {
  return ImageNotifier(
      user: ref.read(authProvider).user!,
      uploadImageCallBack:
          AuthRepositoryImpl(dataSource: AuthDatasourceFirebase()).uploadImage);
});

class ImageNotifier extends StateNotifier<SelectImage> {
  final UserEntity user;
  final Future<String> Function({
    required String id,
    required String path,
  }) uploadImageCallBack;
  ImageNotifier({required this.uploadImageCallBack, required this.user})
      : super(
          SelectImage(path: user.photoPath ?? ''),
        );
  Future<XFile?> selectGalleryImage() async {
    final image = await SelectPicture().getImageGallery();
    if (image == null) return null;
    state = state.copyWith(
      path: image.path,
    );
    return image;
  }

  Future<String> uploadImage({required String id}) async {
    try {
      final url = await uploadImageCallBack(id: id, path: state.path);

      return url;
    } catch (e) {
      return e.toString();
    }
  }
}

class SelectImage {
  final String path;
  SelectImage({this.path = ''});
  SelectImage copyWith({
    String? path,
  }) {
    return SelectImage(
      path: path ?? this.path,
    );
  }
}
