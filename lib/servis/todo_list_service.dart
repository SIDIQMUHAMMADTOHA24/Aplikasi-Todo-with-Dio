import 'package:dio/dio.dart';
import 'package:todo_list/model/todo_model.dart';

class Servis {
  final url = 'https://capekngoding.com/YOURNAME/api/products';

  Future<ContentModel> getData() async {
    try {
      final response = await Dio().get(url);
      return ContentModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future postData({required String judul, required String catatan}) async {
    try {
      final response = await Dio().post(url,
          options: Options(
            headers: {
              'Accept': '*/*',
              'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
              "Content-Type": "application/json",
            },
          ),
          data: {"judul": judul, "catatan": catatan});
      if (response.statusCode == 201) {
        return ContentModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future updateData(
      {required String judul, required String catatan, required int id}) async {
    try {
      final response =
          await Dio().post('https://capekngoding.com/YOURNAME/api/products/$id',
              options: Options(
                headers: {
                  'Accept': '*/*',
                  "Content-Type": "application/json",
                },
              ),
              data: {"judul": judul, "catatan": catatan});
      if (response.statusCode == 201) {
        return ContentModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future deleteData(int id) async {
    var headersList = {'Content-Type': 'application/json'};

    final response = await Dio().delete(
        'https://capekngoding.com/YOURNAME/api/products/$id',
        options: Options(headers: headersList));

    if (response.statusCode == 200) {
      return response.data;
    } else {
      print(response.statusCode);
    }
  }
}
