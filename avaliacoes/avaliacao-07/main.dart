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
      title: 'Sala de Aula',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sala de Aula'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.school,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bem-vindo ao Sala de Aula!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListaDeTurmas()),
                );
              },
              child: const Text('Ver Turmas'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaDeTurmas extends StatelessWidget {
  const ListaDeTurmas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turmas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: const Icon(Icons.class_, size: 40, color: Colors.blue),
            title: const Text(
              'PDM 2',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Programação para Dispositivos Móveis - 2ª turma'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetalhesDaTurma()),
                );
              },
              child: const Text('Ver Turma'),
            ),
          ),
        ),
      ),
    );
  }
}

class DetalhesDaTurma extends StatefulWidget {
  const DetalhesDaTurma({super.key});

  @override
  _DetalhesDaTurmaState createState() => _DetalhesDaTurmaState();
}

class _DetalhesDaTurmaState extends State<DetalhesDaTurma> {
  int contadorAlunos = 0;
  int contadorAtividades = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Turma'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  contadorAlunos++;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListaDeAlunos()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ver Alunos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Cliques: $contadorAlunos',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  contadorAtividades++;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListaDeAtividades()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ver Atividades',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Cliques: $contadorAtividades',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaDeAlunos extends StatelessWidget {
  const ListaDeAlunos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> alunos = ['Cauã Ícaro', 'Gustavo Henrique'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos da Turma'),
      ),
      body: ListView.builder(
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(alunos[index]),
          );
        },
      ),
    );
  }
}

class ListaDeAtividades extends StatelessWidget {
  const ListaDeAtividades({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> atividades = ['Atividade 1 - Introdução', 'Atividade 2 - Widgets Básicos'];
    final List<String> enunciados = [
      'Atividade 1: Criar um aplicativo Flutter que implementa a navegação entre telas. É sugerido o uso de um Drawer.',
      'Atividade 2: Criar uma interface utilizando Widgets de Layout e Stateful Widgets para interações dinâmicas.'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividades'),
      ),
      body: ListView.builder(
        itemCount: atividades.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.task),
            title: Text(atividades[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesAtividade(
                    titulo: atividades[index],
                    enunciado: enunciados[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetalhesAtividade extends StatelessWidget {
  final String titulo;
  final String enunciado;

  const DetalhesAtividade({super.key, required this.titulo, required this.enunciado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          enunciado,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
