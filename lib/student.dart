import 'package:flutter/material.dart';

// Map для списка предметов
Map<int, Map<String, dynamic>> subjects = {
  1: {
    'name': 'Математика',
    'duration': 90,
    'day': 'Понедельник'
  },
  2: {
    'name': 'Физика',
    'duration': 120,
    'day': 'Вторник'
  }
};

class Student extends StatelessWidget {
  const Student({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Предметы')),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index + 1]!;
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                subject['name'] as String, // Явное приведение типа
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('День: ${subject['day'] as String}'), // Явное приведение
                  Text('Продолжительность: ${subject['duration']} мин.'),
                ],
              ),
              leading: const Icon(Icons.book, color: Colors.green),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}