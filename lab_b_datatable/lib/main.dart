import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 05 Lab B',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const CarTablePage(),
    );
  }
}

class Car {
  const Car({required this.make, required this.model, required this.price});

  final String make;
  final String model;
  final int price;
}

class CarTablePage extends StatefulWidget {
  const CarTablePage({super.key});

  @override
  State<CarTablePage> createState() => _CarTablePageState();
}

class _CarTablePageState extends State<CarTablePage> {
  final List<Car> _cars = [
    const Car(make: 'Proton', model: 'X50', price: 92000),
    const Car(make: 'Perodua', model: 'Myvi', price: 47000),
    const Car(make: 'Toyota', model: 'Vios', price: 90000),
    const Car(make: 'Honda', model: 'City', price: 82000),
    const Car(make: 'Mazda', model: 'CX-5', price: 140000),
    const Car(make: 'Nissan', model: 'Almera', price: 78000),
  ];

  int? _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
    Comparable<T> Function(Car car) getField,
    int columnIndex,
    bool ascending,
  ) {
    setState(() {
      _cars.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab 05 - Lab B')),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: DataTable(
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            columns: [
              DataColumn(
                label: const Text('Car Make'),
                onSort: (columnIndex, ascending) =>
                    _sort<String>((car) => car.make, columnIndex, ascending),
              ),
              DataColumn(
                label: const Text('Model'),
                onSort: (columnIndex, ascending) =>
                    _sort<String>((car) => car.model, columnIndex, ascending),
              ),
              DataColumn(
                label: const Text('Price'),
                numeric: true,
                onSort: (columnIndex, ascending) =>
                    _sort<num>((car) => car.price, columnIndex, ascending),
              ),
            ],
            rows: _cars
                .map(
                  (car) => DataRow(
                    cells: [
                      DataCell(Text(car.make)),
                      DataCell(Text(car.model)),
                      DataCell(Text('RM ${car.price}')),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
