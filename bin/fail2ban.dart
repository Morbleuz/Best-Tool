import 'dart:io';

class Fail2Ban {
  static install() async {
    await Process.run('bash', ['-c', 'apt install fail2ban -y']);
    await Process.run('bash', ['-c', 'apt install iptables -y']);
    await Process.run('bash', ['-c','echo [pure-ftpd] >> /etc/fail2ban/jail.d/defaults-debian.conf']);
    await Process.run('bash', ['-c','echo enable=true >> /etc/fail2ban/jail.d/defaults-debian.conf']);
    await Process.run('bash',['-c', 'echo maxretry=3 >> /etc/fail2ban/jail.d/defaults-debian.conf']);
    await Process.run('bash',['-c', 'echo bantime=30 >> /etc/fail2ban/jail.d/defaults-debian.conf']);
    await Process.run('bash', ['-c', 'apt install fail2ban -y']);
  }
}
