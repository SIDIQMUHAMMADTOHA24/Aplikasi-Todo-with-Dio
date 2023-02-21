import 'package:flutter/material.dart';
import 'package:todo_list/core.dart';
import 'package:todo_list/servis/todo_list_service.dart';

class DasboardView extends StatefulWidget {
  const DasboardView({Key? key}) : super(key: key);

  Widget build(context, DasboardController controller) {
    controller.view = this;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddDataView(),
          ));
          await controller.setData(() {});
        },
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "TODO",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: Servis().getData(),
            builder: (context, snapshot) {
              var users = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                const Center(child: Text('eror'));
              }
              return ListView.builder(
                itemCount: users!.listData.length,
                itemBuilder: (context, index) {
                  var data = users.listData[index];
                  return Dismissible(
                      direction: DismissDirection.endToStart,
                      // key: UniqueKey(),
                      key: Key(data.id.toString()),
                      // onDismissed: (direction) {
                      //   Servis().deleteData(data.id);
                      // },
                      confirmDismiss: (direction) => showModalBottomSheet(
                            context: context,
                            builder: (context) => SizedBox(
                              height: 50,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(children: [
                                  Text('Hapus Catatan ?'),
                                  Spacer(),
                                  GestureDetector(
                                      onTap: () async {
                                        await Servis().deleteData(data.id);
                                        Navigator.of(context).pop(true);
                                      },
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel')),
                                ]),
                              ),
                            ),
                          ),
                      child: GestureDetector(
                          onTap: () async {
                            await Navigator.of(context).pushNamed('/edit',
                                arguments: [data.id, data.judul, data.catatan]);
                            await controller.setData(() {});
                          },
                          child: DasboardWidget(data: data)));
                },
              );
            },
          )),
        ],
      ),
    );
  }

  @override
  State<DasboardView> createState() => DasboardController();
}
