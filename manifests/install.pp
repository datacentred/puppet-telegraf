# == Class: telegraf::install
#
# Installs the telegraf package
#
class telegraf::install {

  assert_private()

  case $::osfamily {
    'Debian': {
      apt::source { 'influxdata':
        comment  => 'Mirror for InfluxData packages',
        location => 'https://repos.influxdata.com/ubuntu',
        release  => 'trusty',
        repos    => 'stable',
        key      => {
          'id'     => '05CE15085FC09D18E99EFB22684A14CF2582E0C5',
          'source' => 'https://repos.influxdata.com/influxdb.key',
        },
      }
      ensure_packages(['telegraf'], {'ensure' => $::telegraf::ensure})
    }
    default: {
      fail('Only Ubuntu supported at this time')
    }
  }
}
