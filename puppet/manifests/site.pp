class devserver{
	class{ 'appdev': }
	package{
		[
			'beanstalkd'
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