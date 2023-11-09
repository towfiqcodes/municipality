import 'package:flutter/material.dart';

import 'medium_text_widget.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        border: TableBorder.all(
            color: Colors.black26,
            width: 2,
            borderRadius: BorderRadius.circular(5)),
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(90),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FixedColumnWidth(100),
          4: FixedColumnWidth(50),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: MediumSizeText(
                text: "নাম",
                color: Colors.black,
                size: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: MediumSizeText(
                text: "সম্পর্ক",
                color: Colors.black,
                size: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: MediumSizeText(
                text: "প্রতিবন্ধী",
                color: Colors.black,
                size: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: MediumSizeText(
                text: "পরিচয়পত্র নম্বর",
                color: Colors.black,
                size: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: MediumSizeText(
                text: "বাতিল করুন",
                color: Colors.black,
                size: 14,
              ),
            ),
          ]),
          TableRow(
            decoration: const BoxDecoration(),
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: '',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: 'নির্বাচন করুন',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: 'নির্বাচন করুন',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: '',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.redAccent,
                ),
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          TableRow(
            decoration: const BoxDecoration(),
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: '',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: 'নির্বাচন করুন',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: 'নির্বাচন করুন',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: '',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.redAccent,
                ),
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          TableRow(
            decoration: const BoxDecoration(),
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: '',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: 'নির্বাচন করুন',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: 'নির্বাচন করুন',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(),
                    hintText: '',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.redAccent,
                ),
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
