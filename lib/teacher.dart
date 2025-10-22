import 'package:flutter/material.dart';

// Map для списка преподавателей
Map<int, Map<String, dynamic>> teachers = {
  1: {
    'position': 'Профессор',
    'name': 'Иванов И.И.',
    'phone': '+7 (999) 123-45-67'
  },
  2: {
    'position': 'Доцент',
    'name': 'Петрова П.П.',
    'phone': '+7 (999) 123-45-68'
  }
};

class Teacher extends StatelessWidget {
  const Teacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Преподаватели')),
      body: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacher = teachers[index + 1]!;
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                teacher['name'] as String, // Явное приведение типа
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Должность: ${teacher['position'] as String}'), // Явное приведение
                  Text('Телефон: ${teacher['phone'] as String}'), // Явное приведение
                ],
              ),
              leading: const Icon(Icons.person, color: Colors.blue),
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