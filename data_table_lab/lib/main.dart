import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataTableLab(),
    );
  }
}

class Car {
  final String carMake;
  final int model;
  final int price;

  const Car(this.carMake, this.model, this.price);
}

class DataTableLab extends StatefulWidget {
  const DataTableLab({super.key});

  @override
  State<DataTableLab> createState() => _DataTableLabState();
}

class _DataTableLabState extends State<DataTableLab> {
  final List<Car> cars = [
    const Car('Honda', 2010, 5000),
    const Car('Toyota', 2011, 6000),
    const Car('Pagani', 2012, 7000),
  ];

  int? sortColumnIndex;
  bool sortAscending = true;

  void sortCars(int columnIndex) {
    setState(() {
      if (sortColumnIndex == columnIndex) {
        sortAscending = !sortAscending;
      } else {
        sortColumnIndex = columnIndex;
        sortAscending = true;
      }

      cars.sort((a, b) {
        int result;

        switch (columnIndex) {
          case 0:
            result = a.carMake.compareTo(b.carMake);
            break;
          case 1:
            result = a.model.compareTo(b.model);
            break;
          case 2:
            result = a.price.compareTo(b.price);
            break;
          default:
            result = 0;
        }

        return sortAscending ? result : -result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 05: DataTable Example'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          border: TableBorder.all(color: Colors.black),
          headingRowColor: WidgetStateProperty.all(Colors.grey),
          sortColumnIndex: sortColumnIndex,
          sortAscending: sortAscending,
          columns: [
            DataColumn(
              label: const Text('Car Make'),
              onSort: (columnIndex, ascending) {
                sortCars(columnIndex);
              },
            ),
            DataColumn(
              label: const Text('Model'),
              numeric: true,
              onSort: (columnIndex, ascending) {
                sortCars(columnIndex);
              },
            ),
            DataColumn(
              label: const Text('Price'),
              numeric: true,
              onSort: (columnIndex, ascending) {
                sortCars(columnIndex);
              },
            ),
          ],
          rows: cars.map((car) {
            return DataRow(
              cells: [
                DataCell(Text(car.carMake)),
                DataCell(Text(car.model.toString())),
                DataCell(Text(car.price.toString())),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
