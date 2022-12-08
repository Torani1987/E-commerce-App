import 'package:final_project/model/detail_product.dart';
import 'package:final_project/view_model/get_product.dart';
import 'package:get/get.dart';

import '../model/review_response_model.dart';

class ProductController extends GetxController {
  ProductController._internal();
  static final _singleton = ProductController._internal();
  factory ProductController() => _singleton;
  RxMap<int, DetailProduct> get mapOfDetailProduct => _mapOfDetailProduct;
  final isDetailLoading = false.obs;
  final detailErrorMessage = "".obs;
  final FetchProduct product = FetchProduct();

  final _mapOfDetailProduct = <int, DetailProduct>{}.obs;

  void getDetailProduct(int id) async {
    if (_mapOfDetailProduct.containsKey(id)) {
      return;
    } else {
      isDetailLoading.value = true;
      try {
        final result = await product.getDetailProduct(id);
        _mapOfDetailProduct[id] = result.data;
        detailErrorMessage.value = "";
        _mapOfDetailProduct.refresh();
      } catch (e) {
        detailErrorMessage.value = e.toString();
      } finally {
        isDetailLoading.value = false;
      }
    }
  }

  final isReviewLoading = false.obs;
  final reviewErrorMessage = "".obs;
  final _mapOfReviewProduct = <int, ReviewResponseModel>{}.obs;

  RxMap<int, ReviewResponseModel> get mapOfReviewProduct => _mapOfReviewProduct;

  void getReviewProduct(int id) async {
    if (_mapOfReviewProduct.containsKey(id)) {
      return;
    } else {
      isReviewLoading.value = true;
      try {
        final result = await product.getReviews(id);
        _mapOfReviewProduct[id] = result;
        reviewErrorMessage.value = "";
        _mapOfReviewProduct.refresh();
      } catch (e) {
        reviewErrorMessage.value = e.toString();
      } finally {
        isReviewLoading.value = false;
      }
    }
  }
}
