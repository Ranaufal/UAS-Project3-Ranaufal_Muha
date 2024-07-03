// ignore_for_file: camel_case_types, avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plotem/models/login.dart';
import 'package:plotem/models/user.dart';
import 'package:plotem/models/user_search.dart';
import 'package:plotem/utils/const.dart';
import 'package:plotem/utils/service.dart';

class UserRepository {
// Variable
  String loginUrl = firstlink + "api/login/";
  String apiUrl = firstlink + "api/user";
  String apiManagerUrl =
      firstlink + "api/manageremployees/" + myPegawaiId.toString();

// GET =========================================================

  Future<List<Login>> getLoginUser(String username, String password) async {
    final response =
        await http.get(Uri.parse(loginUrl + username + "/" + password));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<Login> users =
          jsonResponse.map((model) => Login.fromJson(model)).toList();
      return users;
    } else {
      throw Exception('Failed to load users from API');
    }
  }

  Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<User> users =
          jsonResponse.map((model) => User.fromJson(model)).toList();
      return users;
    } else {
      throw Exception('Failed to load users from API');
    }
  }

  Future<List<UserSearch>> getSearchUsers() async {
    final response = await http.get(Uri.parse(firstlink + "api/showSearch"));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<UserSearch> users =
          jsonResponse.map((model) => UserSearch.fromJson(model)).toList();
      return users;
    } else {
      throw Exception('Failed to load users from API');
    }
  }

  Future<List<UserSearch>> getUserByManager() async {
    final response = await http.get(Uri.parse(apiManagerUrl));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<UserSearch> users =
          jsonResponse.map((model) => UserSearch.fromJson(model)).toList();
      return users;
    } else {
      throw Exception('Failed to load users from API');
    }
  }

// POST =========================================================
//   Future<void> createNewUserByAdmin(String nama_user, String email,
//       String password_user, String id_jurusan) async {
//     try {
//       var responseInsert = await http.post(
//         Uri.parse(urlUsers),
//         headers: {
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, String>{
//           "nama_user": nama_user,
//           "email": email,
//           "password_user": password_user,
//           "id_jurusan": id_jurusan,
//           "id_level": "1",
//         }),
//       );
//       if (responseInsert.statusCode == 200) {
//         print("Data User Baru Ditambahkan");
//       } else {
//         print("Data User Baru Gagal Ditambahkan");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> editUserByAdmin(String idUser, String nama_user, String email,
//       String password_user, String id_jurusan) async {
//     try {
//       var responseInsert = await http.patch(
//         Uri.parse(urlUsers + idUser),
//         headers: {
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, String>{
//           "nama_user": nama_user,
//           "email": email,
//           "password_user": password_user,
//           "id_jurusan": id_jurusan,
//         }),
//       );
//       if (responseInsert.statusCode == 200) {
//         print("Data User Baru Diupdate");
//       } else {
//         print("Data User Baru Gagal Diupdate");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

// // DELETE =========================================================
//   Future<void> deleteUser(int id_user) async {
//     try {
//       var responseDelete =
//           await http.delete(Uri.parse(urlDeleteUser + id_user.toString()));
//       if (responseDelete.statusCode == 200) {
//         print("Data User " + id_user.toString() + " Telah Dihapus");
//       } else {
//         print("Data User " + id_user.toString() + " Gagal dihapus");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
}
