import 'package:flutter/material.dart';
import 'package:todo_list/core.dart';
import 'package:todo_list/servis/todo_list_service.dart';
import '../controller/add_data_controller.dart';

class AddDataView extends StatefulWidget {
  const AddDataView({Key? key}) : super(key: key);

  Widget build(context, AddDataController controller) {
    controller.view = this;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        child: const Icon(Icons.save),
        onPressed: () async {
          await Servis().postData(
              judul: controller.judulTectEditingContoller.text,
              catatan: controller.catatanTectEditingContoller.text);
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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
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
  }

  @override
  State<AddDataView> createState() => AddDataController();
}
