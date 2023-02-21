import 'package:flutter/material.dart';
import 'package:todo_list/state_util.dart';
import '../view/add_data_view.dart';

class AddDataController extends State<AddDataView> implements MvcController {
  static late AddDataController instance;
  late AddDataView view;
  TextEditingController judulTectEditingContoller = TextEditingController();
  TextEditingController catatanTectEditingContoller = TextEditingController();

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  setData() {
    setState(() {});
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
