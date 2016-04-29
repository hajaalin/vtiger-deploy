require_relative './vagrant/key_authorization'

Vagrant.configure('2') do |config|
#  config.vm.box = 'ubuntu/trusty64'
  config.vm.box = 'centos/7'
  authorize_key_for_root config, '~/.ssh/id_dsa.pub', '~/.ssh/id_rsa.pub'

  config.vm.synced_folder ".", "/vagrant", disabled: true

  {
    'vtiger'   => '192.168.38.11',
#    'vtiger2'   => '192.168.38.12',
  }.each do |short_name, ip|
    config.vm.define short_name do |host|
      host.vm.network 'private_network', ip: ip
      host.vm.hostname = "#{short_name}.lmu.dev"
      host.vm.synced_folder ".", "/home/vagrant/sync", disabled: true
    end
  end
end
