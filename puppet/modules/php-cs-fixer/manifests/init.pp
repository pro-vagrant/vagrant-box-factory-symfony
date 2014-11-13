class php-cs-fixer {

    exec { 'php-cs-fixer-get':
        command => "wget -O /usr/local/bin/php-cs-fixer http://cs.sensiolabs.org/get/php-cs-fixer.phar",
        path    => '/usr/bin:/bin:/usr/sbin:/sbin',
        onlyif  => 'test ! -f /usr/local/bin/php-cs-fixer'
    }

    exec { 'php-cs-fixer-chmod':
        command => "chmod a+x /usr/local/bin/php-cs-fixer",
        path    => '/usr/bin:/bin:/usr/sbin:/sbin',
        require => Exec['php-cs-fixer-get']
    }

}
