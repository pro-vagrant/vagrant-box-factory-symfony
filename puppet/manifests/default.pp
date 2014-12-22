stage { 'update':
    before => Stage['postupdate']
}

stage { 'postupdate':
    before => Stage['main']
}

class {
    'ubuntu':       stage => update, action => 'clean';
    'mysql':        stage => main;
    'php5':         stage => main;
    'composer':     stage => main;
    'environment':  stage => main;
    'php-cs-fixer': stage => main;
    'box':          stage => main;
    'phpunit':      stage => main;
}

# Necessary to move cache and logs to /tmp/symfony2app/app
file { '/tmp/symfony2app':
    ensure  => directory,
    mode    => 0777,
    owner   => "vagrant",
    group   => "vagrant"
}

# Necessary to move cache and logs to /tmp/symfony2app/app
file { '/tmp/symfony2app/app':
    ensure  => directory,
    mode    => 0777,
    owner   => "vagrant",
    group   => "vagrant"
}

# Necessary to move cache and logs to /tmp/symfony2app/app
file { '/tmp/symfony2app/app/cache':
    ensure  => directory,
    mode    => 0777,
    owner   => "vagrant",
    group   => "vagrant"
}

# Necessary to move cache and logs to /tmp/symfony2app/app
file { '/tmp/symfony2app/app/logs':
    ensure  => directory,
    mode    => 0777,
    owner   => "vagrant",
    group   => "vagrant"
}

# Necessary due to symfony problems with sessions
# stored inside shared vagrant directory.
file { '/tmp/symfony2app/app/cache/sessions':
    ensure  => directory,
    mode    => 0777,
    owner   => "vagrant",
    group   => "vagrant"
}
