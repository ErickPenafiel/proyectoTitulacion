import 'package:postgres/postgres.dart';
import 'usuario.dart';

class ControlUsuario {
  static Set<Set<String>> datos = {
    {'ramiro', '123'},
    {'pedro', '4562'},
    {'jose', '732'},
    {'lucia', '327'}
  };
  static List<Usuario> listUsuarios = [];

  ControlUsuario() {
    cargarDatos();
  }

  static void cargarDatos() {
    Usuario user;
    String nombre;
    String contrasena;
    if (listUsuarios.isEmpty) {
      for (int i = 0; i < datos.length; i++) {
        nombre = datos.elementAt(i).elementAt(0);
        contrasena = datos.elementAt(i).elementAt(1);
        user = Usuario(cuenta: nombre, contrasena: contrasena);
        listUsuarios.add(user);
      }
    }
  }

  bool autentificar(Usuario u) {
    Usuario user;
    cargarDatos();
    for (user in listUsuarios) {
      if (user.cuenta == u.cuenta) if (user.contrasena == u.contrasena)
        return true;
    }
    return false;
  }

  static void addUsuario(Usuario usr) {
    listUsuarios.add(usr);
  }

  static void remUsuario(Usuario u) {
    for (Usuario usr in listUsuarios) {
      if (usr.cuenta == u.cuenta) listUsuarios.remove(usr);
    }
  }

  static void edtUsuario(Usuario u) {
    for (Usuario usr in listUsuarios) {
      if (usr.cuenta == u.cuenta) {
        usr.contrasena = u.contrasena;
      }
    }
  }
}
