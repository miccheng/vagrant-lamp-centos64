class devserver{
	class{ 'appdev': }
	package{
		[
			'beanstalkd',
			'mongodb',
			'mongodb-server',
			'php-pecl-mongo'
		]:
			ensure => present,
			require => Yumrepo['epel']
			;
	}

	service {
		[
			'beanstalkd',
			'mongod'
		]:
			ensure => running,
			enable => true,
			require => Package['beanstalkd', 'mongodb', 'mongodb-server']
			;
	}
}
include devserver