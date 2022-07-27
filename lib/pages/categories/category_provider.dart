import 'package:app/config/cafe_api.dart';
import 'package:app/config/notifications_service.dart';
import 'package:app/pages/categories/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> list = [];
  int count = 0;
 

  CategoryOpts tableOpts =
    CategoryOpts(search: "", page: 1, limit: 25, from: "", to: "");

  Category service = Category(
      id: "",
      name: "",
  );

  setCategory() {
    service = Category(
        id: "",
        name: "",
    );
  }

  setPage(value) {
    tableOpts.page = value;
    getListCategory();
    notifyListeners();
  }

  Future<bool> form() async {
    var url = "/v1/category/new";
    if (service.id.isNotEmpty) url = "/v1/category/edit";
    try {
      final _ = await CafeApi.post(url, service.toMap());
      getListCategory();
      CafeApi.configureDio();
      setCategory();
      notifyListeners();
      return true;
    } catch (e) {
      NotificationsService.showSnackbarError('Error');
      return false;
    }
  }

  getListCategory() async {
    const url = "/v1/category/list";
    final resp = await CafeApi.post(url, tableOpts.toMap());
    final serviceResp = CategoryResponse.fromMap(resp);
    count = serviceResp.count;
    list = [...serviceResp.list];
    notifyListeners();
  }
}