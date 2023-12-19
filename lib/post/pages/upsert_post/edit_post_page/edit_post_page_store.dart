
import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:mewtwo/home/api/api.dart';
import 'package:mewtwo/mew.dart';
import 'package:mewtwo/post/api/api.dart';
import 'package:mewtwo/post/pages/upsert_post/upsert_post_base/upsert_post_base_store.dart';
import 'package:mobx/mobx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_post_page_store.g.dart';


@riverpod
EditPostPageStore editPostPageStore(EditPostPageStoreRef ref, {required int postId}) {
  final store = EditPostPageStore(postId: postId);
  store.load();
  ref.onDispose(() {
    store.dispose();
  });
  return store;
}


class EditPostPageStore extends AbsEditPostPageStore with _$EditPostPageStore {
  EditPostPageStore({required int postId}) : super(postId: postId);
}

abstract class AbsEditPostPageStore extends UpsertPostBaseStore with Store {
  final int postId;
  AbsEditPostPageStore({required this.postId});

  @observable
  bool _isLoading = false;

  @action
  Future<void> load() async {
    final getPostsProvider = GetPostDetailsApiProvider(postId: postId);

    final listener = Mew.pc.listen(getPostsProvider, (previous, next) {
      _isLoading = next.isLoading;
    });
    final res = await Mew.pc.read(getPostsProvider.future);
    if (res != null) {
      displayImagePaths = ObservableList.of([res.image]) ;
      controller.text = res.caption;
      
    }
    listener.close();

  }

  @override
  @action
  Future<bool> post() async {
   final photosToPost = displayImagePaths
        .mapIndexed<PostPhoto?>((index, path) {
          if (!path.startsWith("http")) {
            PostPhoto(index: index, photoFileBytes: File(path).readAsBytesSync());
          }
          return null;
        })
        .whereNotNull()
        .toList();
    final editPostApiProvider = EditPostApiProvider(
      postId: postId,
      caption: controller.text, chatEnabled: shopMyLook, photos: photosToPost);
    final res = await Mew.pc.read(editPostApiProvider.future);
    return res;
  }
}




