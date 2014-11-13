class phpunit {

    if defined(Package['curl']) == false {
        package { 'curl':
            ensure => present
        }
    }

    if defined(Package['php5-xdebug']) == false {
        package { 'php5-xdebug':
            ensure => present,
            require => Package['php5']
        }
    }

    if defined(Package['php5-xsl']) == false {
        package { 'php5-xsl':
            ensure => present,
            require => Package['php5']
        }
    }

    if defined(Package['php5-curl']) == false {
        package { 'php5-curl':
            ensure => present,
            require => Package['php5']
        }
    }


    exec { 'phpunit-get':
        path => '/bin:/usr/bin',
        command => 'curl https://phar.phpunit.de/phpunit.phar -o /usr/local/bin/phpunit 2>/dev/null',
        onlyif  => 'test ! -f /usr/local/bin/phpunit',
        require => [Package['curl']]
    }

    exec { 'phpunit-chmod':
        command => "chmod +x /usr/local/bin/phpunit",
        path    => '/usr/bin:/bin:/usr/sbin:/sbin',
        require => Exec['phpunit-get']
    }

}
