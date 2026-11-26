import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

const List<Student> students = [
  Student(
    name: 'Jimmy Abenoja',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'jimmy.abenoja@school.edu',
  ),
  Student(
    name: 'Khen Lumindas',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'khen.lumindas@school.edu',
  ),
  Student(
    name: 'Jed Mendoza',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'jed.mendoza@school.edu',
  ),
  Student(
    name: 'Jonard Osa',
    course: 'BS Computer Engineering',
    yearLevel: 1,
    email: 'jonard.osa@school.edu',
  ),
  Student(
    name: 'Jhay Aguelo',
    course: 'BS Nursing',
    yearLevel: 2,
    email: 'jhay.agueloz@school.edu',
  ),
];

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Customization: bold nga colored text para sa heading
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const Divider(), // Linya sa ubos sa heading
      ],
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[700]),
        const SizedBox(width: 8), // Gamay nga gap tali sa icon ug text
        Text(text),
      ],
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      // Customization: rounded corners sa card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        // Customization: spacing sulod sa card
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Customization: avatar color (primary ang background)
            CircleAvatar(
              radius: 28,
              backgroundColor: scheme.primary,
              foregroundColor: scheme.onPrimary,
              child: Text(student.name[0]),
            ),
            const SizedBox(width: 16),
            // Expanded aron mo-fill ang nahabilin nga width
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Customization: bold nga style para sa pangalan
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(student.course),
                  const SizedBox(height: 8),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year ${student.yearLevel}',
                  ),
                  const SizedBox(height: 4),
                  InfoRow(
                    icon: Icons.email,
                    text: student.email,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Directory'),
      ),
      body: ListView(
        // Customization: spacing sa palibot sa listahan
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: 'Students'),
          const SizedBox(height: 12),
          // Usa ka StudentCard para sa matag estudyante
          for (final student in students)
            Padding(
              padding: const EdgeInsets.only(bottom: 12), // Spacing tali sa mga card
              child: StudentCard(student: student),
            ),
        ],
      ),
    );
  }
}

class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Customization: theme seed color (teal)
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}