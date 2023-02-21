import 'package:flutter/material.dart';

import '../../../servis/todo_list_service.dart';
import '../controller/edit_data_controller.dart';
import 'package:todo_list/core.dart';
import 'package:get/get.dart';

class EditDataView extends StatelessWidget {
  const EditDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditDataController>(
      init: EditDataController(),
      builder: (controller) {
        controller.view = this;
        final args = ModalRoute.of(context)!.settings.arguments as List;
        if (args[1].isNotEmpty) {
          controller.judulTectEditingContoller.text = args[1];
        }
        if (args[2].isNotEmpty) {
          controller.catatanTectEditingContoller.text = args[2];
        }
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey[700],
            child: const Icon(Icons.save),
            onPressed: () async {
              await Servis().updateData(
                  judul: controller.judulTectEditingContoller.text,
                  catatan: controller.catatanTectEditingContoller.text,
                  id: args[0]);
              Navigator.pop(context);
            },
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Buat Catatan",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: controller.judulTectEditingContoller,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                      constraints: BoxConstraints.tightFor(height: 30),
                      contentPadding: EdgeInsets.all(0),
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintText: 'Judul'),
                ),
                TextFormField(
                  controller: controller.catatanTectEditingContoller,
                  maxLines: null,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintText: 'Catatan'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
