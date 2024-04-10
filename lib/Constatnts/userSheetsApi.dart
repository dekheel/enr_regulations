import 'dart:core';
import 'package:enr_regulations/Constatnts/Users.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  // spreadsheet api to update and delete its content
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "enrregulations",
  "private_key_id": "02dc653b71480b6c288b5bea18559f9f3056df86",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDdLNCqwLdPZKXU\nvOo7T1R3q7EKsyimsnnMMO+Tksbgz94ZlYyGMy38eZxjFhkown4708bnlWHWDV7u\nhfHxT5LvTTN13GRlqZuYG8uO69SpZgQQl+MxIGLEoprzxIPt1c9taVbdASAkoou0\nZiBhJ8CXS0s7GL/NmEy2RGq3F1GVwaCzHjGs7xJrbBXjoTuXWbT8kMEJ2I2kL33O\nO/2F+PC3JecuHGwLMqjMk6/xMDLZ8QtF+GPCJnOC0w+Z004+ud2olm3fFm07cHJi\nGTNGNZk6QCl8wHtRj0bf2O6Asb2r/GojCvBRub5j6Bjr39snRo1B1IAh68z8bjD9\nNa8SK8TzAgMBAAECggEAIzLfzd+YAhNsoskikSgkXgaIc+v5nbc3VAGRDHrQ73Pq\nuZvyaQ8Zvp2kqk5DgxhE2lpEmZQipbFWDilp94iS7puU2NPSHy3EEeE73uB1j99T\nk/J1g9rOwn11od2Ao31MoscfaFJRXmiHSZab3j+4fOYiMGMAGgT8EbZyB0u3k63u\nV753e9enmVltvJJ4m8ZpXTEvCj3DaXKNAd5t3VgBngFcZX84H/tAf+1kxbApd44c\no+7DhrlVibSi+fEKdpcea+RkpUoRz3TtwENl3y7SWyKUZ30fVRMyCS2a9ZvzWWfM\nUGkXS9HmIvoz7tF7tOEi+YLiRY8rbfl0b6I3p2Ay/QKBgQD6VtHZROlIi0T5eTgK\nib8Qtdl/FLbegSWL045gTaSC5mVN+Xqj/mDxo5ZZouvxfj/HuztP2aFpb/brkMup\nJ2zTi/3ioVjf77zsTv7b+k2HRfnhhwOTZLQY7iuTzk66FY85qFI0QAxWED8docA4\n9doBn1g/p7xGdHIJ4qvTWXYcJwKBgQDiLSsaDOiEGz1y65o1JFtVLGTvsE/ymP+y\n5YFvhdqrpNmf3WeKmdQ6SpT+4fjCY86EQwlxOXfls31/wgdtIzUTO+Y8ay8sGd59\nG13m3cOuZp1i2v3NnLyRtMPtnibSlDObBiS8Uyqws2CNNG6U9WDqKoJHZXJTLwQw\neDCwAS+0VQKBgAEehD+pbDWT0dIftZ1ucjk75uYHjK2//A/8+ST7E+I173wCwoab\nK4nJBnIOJWnl+5kEAEbiHTOgeYUiF5cBAx6LAK6TtBcENl8EF2WaX+Bb8rsMZHqz\nN47o+a7mfDmewQ4r73omUyfLWMzkHTzj9H6PXNCkClZyTNQ4fDYsrzd/AoGBAKhJ\niWeBsUQSbJ9kdEIUQizWsmexnVrZwm/e2ncbdn/+UbrkZ1U2bjXNJp2bj5c74f6B\nTrZDV1W/PqLfwNzQtH4SNJZB/kBnIyedRDoySZYrXfGfFfd2JsyXXq0f3q0Sfm9b\nm9vQWdROM4n9OEZ3aVvysyribbU9J3XVCAz9ZPxdAoGBAOnFDcEjaJXVfsKOpNR5\n8mT1YBtWw5xqzZQRbtckDKWmTOKCrxMD3nJpfxnbH21oehB0rwsDQLYG/ZpiZZ5I\n+OGU1JDzefQevnK4K8y8m7ruaS8knaJB8oIutInfChhe4ozcxNiD3YPym9ts2a6V\n68586ywf0NveCqQx5GOwoPUN\n-----END PRIVATE KEY-----\n",
  "client_email": "enrregulations@enrregulations.iam.gserviceaccount.com",
  "client_id": "105902768581847882420",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/enrregulations%40enrregulations.iam.gserviceaccount.com"
}
''';
  // spreadsheet ID to access specific sheet on google sheet

  static final _spreadSheetsId = "1HU-G1DmJI2m4A32KhfxbX_ylNDhzXY_0gWEZHgsdCF4";

  // worksheet variable
  static Worksheet? _userSheet;

  // call spreadsheet api to update and delete its content and pass it into variable
  static final _gsheets = GSheets(_credentials);

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadSheetsId);
      _userSheet = await _getWorkSheet(spreadsheet, title: "users");
      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<user?> getDataBySap(String userSap) async {
    if (_userSheet != null) {
      final json = await _userSheet!.values.rowByKey(userSap, fromColumn: 1);
      if (json != null) {
        return user.fromJson(json);
      } else {
        return null;
      }
    }
  }

  static Future insert(List<Map<String, dynamic>> rowlist) async {
    if (_userSheet != null) {
      _userSheet!.values.map.appendRows(rowlist);
    }
  }

  static Future updateCell(
      {required String id, required String key, required dynamic value}) async {
    if (_userSheet != null) {
      return _userSheet!.values
          .insertValueByKeys(value, columnKey: key, rowKey: id);
    }
  }
}
