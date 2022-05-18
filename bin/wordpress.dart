import 'dart:io';

class Wordpress{
  static Future<void> install(String nomBDD,String compte,String mdp) async{
        await Process.run('bash', ['-c','apt update -y' ]);
        await Process.run('bash', ['-c','apt install php -y' ]);
        await Process.run('bash', ['-c','apt install apache2 -y' ]);
        await Process.run('bash', ['-c','apt install php-mysql -y' ]);
        await Process.run('bash', ['-c','apt install mariadb-server -y' ]);
        await Process.run('bash', ['-c','"CREATE DATABASE "$nomBDD"; GRANT ALL PRIVILEGES ON "$nomBDD".* to '"$compte"' @localhost identified by '"$mdp"';"' ]);
        await Process.run('bash', ['-c','apt install wget -y' ]);
        await Process.run('bash', ['-c','cd /var/www/html && wget https://www.pedagogeek.fr/cours/srvweb/Ressources/appliweb/wordpress-5.8.3-fr_FR.tar.gz --user eleve --password educ2122' ]);
        await Process.run('bash', ['-c','cd /var/www/html && tar xzvf wordpress-5.8.3-fr_FR.tar.gz' ]);
        await Process.run('bash', ['-c','chown -R www-data:www-data /var/www/html/wordpress' ]);
        await Process.run('bash', ['-c','cd /var/www/html && rm wordpress-5.8.3-fr_FR.tar.gz' ]);
        await Process.run('bash', ['-c','service apache2 restart' ]);
  }
}