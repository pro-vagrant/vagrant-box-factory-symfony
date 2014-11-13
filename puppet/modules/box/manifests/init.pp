class box {

    exec { 'box-get':
        command => "wget -O /usr/local/bin/box https://github.com/kherge-archive/Box/releases/download/2.4.4/box-2.4.4.phar",
        path    => '/usr/bin:/bin:/usr/sbin:/sbin',
        onlyif  => 'test ! -f /usr/local/bin/box',
        require => Package['php5']
    }

    exec { 'box-chmod':
        command => "chmod a+x /usr/local/bin/box",
        path    => '/usr/bin:/bin:/usr/sbin:/sbin',
        require => Exec['box-get']
    }

}
