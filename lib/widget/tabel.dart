import 'package:flutter/cupertino.dart';

class Tabel extends StatelessWidget {
  const Tabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 320.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20,),
        child: Table(
          border: TableBorder.all(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: const [
            // Header Tabel
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TableCell(child: Center(child: Text('Nomor',style: TextStyle(fontWeight: FontWeight.bold),))),
                ),
                TableCell(child: Center(child: Text('Parameter',style: TextStyle(fontWeight: FontWeight.bold),))),
                TableCell(child: Center(child: Text('Literatur',style: TextStyle(fontWeight: FontWeight.bold),))),
              ],
            ),
            // Baris 1
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TableCell(child: Center(child: Text('1'))),
                ),
                TableCell(child: Center(child: Text('pH'))),
                TableCell(child: Center(child: Text('6,5'))),
              ],
            ),
            // Baris 2
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TableCell(child: Center(child: Text('2'))),
                ),
                TableCell(child: Center(child: Text('Suhu'))),
                TableCell(child: Center(child: Text('28*C'))),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TableCell(child: Center(child: Text('3'))),
                ),
                TableCell(child: Center(child: Text('Salinitas'))),
                TableCell(child: Center(child: Text('10-35 ppt'))),
              ],
            ),TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TableCell(child: Center(child: Text('4'))),
                ),
                TableCell(child: Center(child: Text('Ketinggian Air'))),
                TableCell(child: Center(child: Text('120 cm'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
