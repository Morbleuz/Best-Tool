import 'dart:io';

<<<<<<< HEAD
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
=======
class Wordpress {
  static Future<void> install(String nomBDD, String compte, String mdp) async {
    print("lancement");
    await Process.run('bash', ['-c', 'apt update -y']);
    print("1");
    await Process.run('bash', ['-c', 'apt install php -y']);
    print("2");
    await Process.run('bash', ['-c', 'apt install php-mysql -y']);
    print("3");
    await Process.run('bash', ['-c', 'apt install mariadb-server -y']);
    print("4");
    await Process.run('bash', [
      '-c',
      '"CREATE DATABASE "$nomBDD"; GRANT ALL PRIVILEGES ON "$nomBDD".* to '
          "$compte"
          ' @localhost identified by '
          "$mdp"
          ';"'
    ]);
    print("5");
    await Process.run('bash', [
      '-c',
      'cd /var/www/html && wget https://www.pedagogeek.fr/cours/srvweb/Ressources/appliweb/wordpress-5.8.3-fr_FR.tar.gz --user eleve --password educ2122'
    ]);
    print("6");
    await Process.run('bash',
        ['-c', 'cd /var/www/html && tar xzvf wordpress-5.8.3-fr_FR.tar.gz']);
    print("7");
    await Process.run(
        'bash', ['-c', 'chown -R www-data:www-data /var/www/html/wordpress']);
    await Process.run(
        'bash', ['-c', 'cd /var/www/html && rm wordpress-5.8.3-fr_FR.tar.gz']);
    await Process.run('bash', ['-c', 'service apache2 restart']);
>>>>>>> a0c77771bc23dacc96c55c87da6761454647bd3a
  }
}
