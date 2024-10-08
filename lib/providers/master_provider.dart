import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:web/model/master_student.dart';
import 'package:web/model/studentsuccess.dart';
import 'package:web/services/masterstudentservice.dart';

class MasterProvider extends ChangeNotifier {
  final _service = MasterStudentService();
  bool isLoading = false;

  String _error = '';
  String get error => _error;

  Uint8List _imageData = Uint8List(0);
  Uint8List get imageData => _imageData;

  MasterStudent _student = MasterStudent(
    stdcode: '',
    namethai: '',
    nameeng: '',
    birthdate: '',
    stdstatusdescthai: '',
    citizenid: '',
    regionalnamethai: '',
    stdtypedescthai: '',
    facultynamethai: '',
    majornamethai: '',
    waivedno: '',
    waivedpaid: '',
    waivedtotalcredit: 0,
    chkcertnamethai: '',
    penalnamethai: '',
    mobiletelephone: '',
    emailaddress: '',
  );
  MasterStudent get student => _student;

  // ignore: prefer_final_fields
  MasterSuccess _success = MasterSuccess();
  MasterSuccess get success => _success;

  Future<void> getImageProfileById(String id) async {
    isLoading = true;
    _error = '';

    try {
      final response = await _service.getImageProfileById(id);
      //print(response);
      _imageData = response;

      if (_imageData == Uint8List(0)) {
        _error = "not found";
      }
    } catch (e) {
      _error = e.toString();
      print(e);
    }

    isLoading = false;

    notifyListeners();
  }

  Future<void> getImageProfile() async {
    isLoading = true;
    _error = '';

    try {
      final response = await _service.getImageProfile();
      //print(response);
      _imageData = response;

      if (_imageData == Uint8List(0)) {
        _error = "not found";
      }
    } catch (e) {
      _error = e.toString();
      print(e);
    }

    isLoading = false;

    notifyListeners();
  }

  Future<void> refreshData() async {
    await getStudent();
    getImageProfile();
  }

  Future<void> getStudent() async {
    isLoading = true;
    _error = '';

    try {
      final response = await _service.getStudent();
      _student = response;
    } on Exception catch (e) {
      isLoading = false;
      _error = 'เกิดข้อผิดพลาดดึงข้อมูลนักศึกษา';
    }

    //await _service.asyncName();

    isLoading = false;
    notifyListeners();
  }

  Future<void> getSuccessById(String id) async {
    isLoading = true;
    _error = '';

    try {
      final response = await _service.getStudentSuccessById(id);
      _success = response;
    } on Exception catch (e) {
      isLoading = false;
      _error = 'เกิดข้อผิดพลาดดึงข้อมูลจบการศึกษา';
    }

    //await _service.asyncName();

    isLoading = false;
    notifyListeners();
  }

  Future<void> getSuccess() async {
    isLoading = true;
    _error = '';

    try {
      final response = await _service.getStudentSuccess();
      _success = response;
    } on Exception catch (e) {
      isLoading = false;
      _error = 'เกิดข้อผิดพลาดดึงข้อมูลจบการศึกษา';
    }

    //await _service.asyncName();

    isLoading = false;
    notifyListeners();
  }
}
