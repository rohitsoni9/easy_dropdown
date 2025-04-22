import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easy_dropdown/flutter_easy_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Easy Dropdown Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedCountry;
  String? selectedUser;

  // Offline data example
  final List<Map<String, dynamic>> countries = [
    {'id': '1', 'name': 'United States'},
    {'id': '2', 'name': 'Canada'},
    {'id': '3', 'name': 'United Kingdom'},
    {'id': '4', 'name': 'Australia'},
    {'id': '5', 'name': 'Germany'},
  ];

  // Online data example URL
  final String usersApiUrl = 'https://jsonplaceholder.typicode.com/users';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Easy Dropdown Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Offline Dropdown Example:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SelectDialog<Map<String, dynamic>>(
              selectedValue: selectedCountry != null
                  ? countries.firstWhere((c) => c['id'] == selectedCountry)
                  : null,
              items: countries,
              showSearchBox: true,
              onChanged: (value) {
                setState(() {
                  selectedCountry = value['id'];
                });
              },
              itemBuilder: (context, item, isSelected) {
                return ListTile(
                  title: Text(item['name']),
                  selected: isSelected,
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Online Dropdown Example:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SelectDialog<Map<String, dynamic>>(
              selectedValue: null,
              showSearchBox: true,
              isFilteredOnline: true,
              onFind: (text) async {
                final response = await Dio().get(usersApiUrl);
                final List<dynamic> users = response.data;
                return users
                    .where((user) => user['name']
                        .toString()
                        .toLowerCase()
                        .contains(text.toLowerCase()))
                    .map((user) => Map<String, dynamic>.from(user))
                    .toList();
              },
              onChanged: (value) {
                setState(() {
                  selectedUser = value['id'].toString();
                });
              },
              itemBuilder: (context, item, isSelected) {
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(item['email']),
                  selected: isSelected,
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Selected Country: ${selectedCountry ?? 'None'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Selected User: ${selectedUser ?? 'None'}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
