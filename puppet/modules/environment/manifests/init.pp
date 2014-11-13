class environment {

    exec { 'environment::cd-vagrant':
        command => "/bin/echo -e \"\\n\\ncd /vagrant \\n\\n\" >> /home/vagrant/.profile",
        cwd => "/vagrant",
        path    => '/bin:/usr/bin:/bin:/usr/sbin:/sbin',
    }

}
