class devserver{
	class{ 'appdev': }
	package{
		[
			'beanstalkd',
			'phpMyAdmin'
		]:
			ensure => present,
			require => Yumrepo['epel']
			;
	}

	service {
		'beanstalkd':
			ensure => running,
			enable => true,
			require => Package['beanstalkd']
			;
	}
}
include devserver