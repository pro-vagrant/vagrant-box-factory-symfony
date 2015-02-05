stage { 'update':
    before => Stage['postupdate']
}

stage { 'postupdate':
    before => Stage['main']
}

class {
    'ubuntu':      stage => update, action => 'clean';
    'apache':      stage => main, default_vhost => false;
    'php5':        stage => main, require => Class['apache'];
    'environment': stage => main;
    'nodejs':      stage => main;
}

exec { 'install less node module':
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => 'npm install -g less &> /dev/null',
    require => Class['nodejs'],
}

class { 'php_phars':
    stage => main,
    all   => true,
}

file { '/tmp/symfony2app':
    ensure  => directory,
    mode    => 0777,
    owner   => 'vagrant',
    group   => 'vagrant'
}

file { '/tmp/symfony2app/app':
    ensure  => directory,
    mode    => 0777,
    owner   => 'vagrant',
    group   => 'vagrant',
    require => File['/tmp/symfony2app']
}

file { '/tmp/symfony2app/app/cache':
    ensure  => directory,
    mode    => 0777,
    owner   => 'vagrant',
    group   => 'vagrant',
    require => File['/tmp/symfony2app/app']
}

file { '/tmp/symfony2app/app/logs':
    ensure  => directory,
    mode    => 0777,
    owner   => 'vagrant',
    group   => 'vagrant',
    require => File['/tmp/symfony2app/app']
}

# Necessary due to symfony problems with sessions
# stored inside shared vagrant directory.
file { '/tmp/symfony2app/app/cache/sessions':
    ensure  => directory,
    mode    => 0777,
    owner   => 'vagrant',
    group   => 'vagrant',
    require => File['/tmp/symfony2app/app/cache']
}

class { 'mysql::server': }

mysql::db { 'symfony':
  user     => 'symfony',
  password => 'symfony',
  ensure   => present,
  charset  => 'utf8',
  require  => Class['mysql::server']
}

#class { 'cachedeps':
#    stage   => main,
#    require => Class['php_phars']
#}

#file { '/var/www/html':
#    path    => '/var/www/html',
#    ensure  => link,
#    force   => true,
#    target  => '/vagrant/web',
#    require => Package['php5'],
#    notify  => Exec['php5:restart']
#}


apache::vhost { 'app.lh':
    port          => '80',
    docroot       => '/vagrant/web',
    docroot_owner => 'vagrant',
    docroot_group => 'vagrant',
    notify        => Exec['php5:restart'],
}

