import 'package:find_test/characters_page.dart';
import 'package:find_test/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste Marvete"),
      ),
      body: Center(
        child: TextButton(
          child: Text("Pressione"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CharactersPage(),
            ),
          ),
        ),
      ),
    );
  }
}
