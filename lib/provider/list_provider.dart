import 'package:flutter/material.dart';
import 'package:provider_list/http/people_info_http.dart';
import 'package:provider_list/model/list_model.dart';

class PeopleInfoProvider extends ChangeNotifier {
  PeopleInfoService _peopleInfoService = PeopleInfoService();
  List<People> _peopleModel = [];
  List<People> get peopleModel => _peopleModel;
  
  loadRecipientInfo(int centerId, int recipientId) async {
    List<People> peopleInfoList = await _peopleInfoService.loadPeopleInfo();
    _peopleModel = peopleInfoList;
    notifyListeners();
  }
}