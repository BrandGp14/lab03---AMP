// Clase base Usuario
class Usuario {
  String nombre;
  String email;
  String _contrasena; 

  Usuario(this.nombre, this.email, this._contrasena);

  String get contrasena => _contrasena;
}

mixin Autenticacion {
  bool iniciarSesion(String email, String contrasena, Usuario usuario) {
    if (usuario.email == email && usuario.contrasena == contrasena) {
      print('Inicio de sesión exitoso para ${usuario.nombre}');
      return true;
    } else {
      print('Error: Email o contraseña incorrectos');
      return false;
    }
  }
}

class UsuarioAutenticado extends Usuario with Autenticacion {
  UsuarioAutenticado(String nombre, String email, String contrasena)
      : super(nombre, email, contrasena);
}

void main() {
  var usuario = UsuarioAutenticado('Juan Pérez', 'juan@example.com', '123456');

  print('Intento de inicio de sesión 1:');
  usuario.iniciarSesion('juan@example.com', '123456', usuario);

  print('\nIntento de inicio de sesión 2:');
  usuario.iniciarSesion('juan@example.com', 'claveerronea', usuario);
}
