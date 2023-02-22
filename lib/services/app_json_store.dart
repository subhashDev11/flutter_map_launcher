// import 'package:json_store/json_store.dart';
//
//
// class AppJsonStore {
//   late final JsonStore jsonStore;
//
//   AppJsonStore.init() {
//     jsonStore = JsonStore();
//   }
//
//   Future<dynamic> getData(String key) async {
//     final jsonData = await jsonStore.getItem(key);
//     return jsonData;
//   }
//
//   Future<void> setData(String key,{required Map<String,dynamic> data}) async {
//     await jsonStore.setItem('user_session', data);
//   }
//
//   Future<void> deleteData(String key) async {
//     return await jsonStore.deleteItem(key);
//   }
//
// }
