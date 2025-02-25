import 'dart:convert';

// Classe Dependente
class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  // Método para conversão de Dependente para JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

// Classe Funcionario
class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  // Método para conversão de Funcionario para JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes':
          _dependentes.map((dependente) => dependente.toJson()).toList(),
    };
  }
}

// Classe EquipeProjeto
class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeProjeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeProjeto;
    _funcionarios = funcionarios;
  }

  // Método para conversão de EquipeProjeto para JSON
  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios':
          _funcionarios.map((funcionario) => funcionario.toJson()).toList(),
    };
  }
}

void main() {
  // Criar objetos Dependentes
  var dependente1 = Dependente('Mariana');
  var dependente2 = Dependente('Josué');
  var dependente3 = Dependente('Amanda');
  var dependente4 = Dependente('Perola');

  // Criar objetos Funcionarios
  var funcionario1 = Funcionario('João', [dependente1, dependente2]);
  var funcionario2 = Funcionario('Carla', [dependente3]);
  var funcionario3 = Funcionario('Fernanda', [dependente4]);

  // Criar lista de Funcionarios
  var funcionarios = [funcionario1, funcionario2, funcionario3];

  // Criar objeto EquipeProjeto
  var equipeProjeto = EquipeProjeto('Projeto XYZ', funcionarios);

  // Printar o objeto EquipeProjeto no formato JSON
  var jsonEquipeProjeto = jsonEncode(equipeProjeto.toJson());
  print(jsonEquipeProjeto);
}
