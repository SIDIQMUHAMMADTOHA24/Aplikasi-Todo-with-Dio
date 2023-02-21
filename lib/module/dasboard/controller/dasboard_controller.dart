import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/servis/todo_list_service.dart';
import 'package:todo_list/state_util.dart';
import '../view/dasboard_view.dart';

class DasboardController extends State<DasboardView> implements MvcController {
  static late DasboardController instance;
  late DasboardView view;

  bool isDismis = false;

  dismisOn() {
    isDismis = true;
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  setData(Null Function() param0) {
    setState(() {});
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
