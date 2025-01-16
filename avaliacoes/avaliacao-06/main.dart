import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação entre Telas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Tela1(),
    );
  }
}

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adicionando a imagem acima do nome da atividade
            
            const SizedBox(height: 20),
            const Text(
              'Atividade 06 - Navegação entre telas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tela2()),
                );
              },
              child: const Text('Ver Atividade'),
            ),
          ],
        ),
      ),
    );
  }
}

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Descrição:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, 
              ),
              const Text(
                'Criar uma aplicação Flutter que implementa a navegação entre telas. '
                'É sugerido o uso de um Drawer. Evidenciar o código e a navegação entre as telas. \n',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center, 
              ),
              const Text(
                'OBS:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, 
              ),
              const Text(
                'Equipe com 2 alunos. Cada aluno deve postar no seu Github as evidências na pasta avaliação-08. ',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center, 
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Volta para a Tela 1
                },
                child: const Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
