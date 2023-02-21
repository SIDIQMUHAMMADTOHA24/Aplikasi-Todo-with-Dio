import 'package:flutter/material.dart';

import '../../../model/todo_model.dart';

class DasboardWidget extends StatelessWidget {
  const DasboardWidget({
    super.key,
    required this.data,
  });

  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        color: Colors.black.withOpacity(0),
        border: Border.all(
          color: Colors.grey[600]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Text(
              data.judul!,
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(data.catatan!),
        ],
      ),
    );
  }
}
