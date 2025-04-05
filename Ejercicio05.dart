class Votante {
  String nombre;
  int edad;
  bool haVotado;

  Votante(this.nombre, this.edad, {this.haVotado = false});

  @override
  String toString() {
    return 'Votante: $nombre, Edad: $edad, Ha votado: ${haVotado ? "Sí" : "No"}';
  }
}

mixin ValidacionVoto {
  bool validarVoto(Votante votante) {
    if (votante.edad >= 18 && !votante.haVotado) {
      print('${votante.nombre} es elegible para votar.');
      return true;
    } else {
      if (votante.edad < 18) {
        print('${votante.nombre} no es elegible: Menor de edad (${votante.edad} años).');
      }
      if (votante.haVotado) {
        print('${votante.nombre} no es elegible: Ya ha votado.');
      }
      return false;
    }
  }
}

class VotanteValido extends Votante with ValidacionVoto {
  VotanteValido(String nombre, int edad, {bool haVotado = false})
      : super(nombre, edad, haVotado: haVotado);
}

void main() {
  var votante1 = VotanteValido('María García', 25);
  var votante2 = VotanteValido('Carlos López', 16);
  var votante3 = VotanteValido('Ana Martínez', 30, haVotado: true);

  print('\nValidación de votantes:');
  print('-----------------------');
  
  print('\nVotante 1:');
  votante1.validarVoto(votante1);
  
  print('\nVotante 2:');
  votante2.validarVoto(votante2);
  
  print('\nVotante 3:');
  votante3.validarVoto(votante3);

  if (votante1.validarVoto(votante1)) {
    votante1.haVotado = true;
    print('\n${votante1.nombre} ha emitido su voto exitosamente.');
    print('Estado actual: ${votante1}');
  }
}
