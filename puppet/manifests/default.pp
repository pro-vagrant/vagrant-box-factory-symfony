stage { 'update':
    before => Stage['postupdate']
}

stage { 'postupdate':
    before => Stage['main']
}

class {
    'ubuntu':       stage => update, action => 'clean';
    'php5':         stage => main;
    'environment':  stage => main;
    'php-cs-fixer': stage => main;
    'box':          stage => main;
    'phpunit':      stage => main;
    'composer':     stage => main;
}

#class { 'composer':
#    stage        => main,
#    command_name => 'composer',
#    target_dir   => '/usr/local/bin'
#}

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
  require  => Class['mysql::server'],
}


class { 'cachedeps':
#    stage => main,
    require => Class['composer']
}
