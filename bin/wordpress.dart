import 'dart:io';

class Wordpress{
  static Future<void> install(String nomBDD,String compte,String mdp) async{
        await Process.run('bash', ['-c','apt update' ]);
        await Process.run('bash', ['-c','apt install php -y' ]);
        await Process.run('bash', ['-c','apt install php-mysql -y' ]);
        await Process.run('bash', ['-c','apt install mariadb-server -y' ]);
        await Process.run('bash', ['-c','"CREATE DATABASE "$nomBDD"; GRANT ALL PRIVILEGES ON "$nomBDD".* to '"$compte"' @localhost identified by '"$mdp"';"' ]);
        await Process.run('bash', ['-c','"CREATE DATABASE "$nomBDD"; GRANT ALL PRIVILEGES ON "$nomBDD".* to '"$compte"' @localhost identified by '"$mdp"';"' ]);
  }
}