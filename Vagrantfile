# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Give the box 3GB or RAM and 2 cores
  config.vm.provider 'virtualbox' do |v|
    v.cpus = 2
    v.memory = 3072
  end

  # Configure the actual windows machine
  config.vm.define "${vagrant-box.name}" do |windows|
  	windows.vm.guest = :windows
    windows.vm.box = "${vagrant-box.name}"
  	windows.vm.box_url = "file://~/Downloads/${vagrant-box.name}.box"

    # Set up WinRM communication
    windows.vm.communicator = 'winrm'
    windows.winrm.username = "IEUser"
  	windows.winrm.password = "Passw0rd!"
    windows.vm.network 'forwarded_port', host: 3389, guest: 3389
    
    # Share the folders needed for our build
  	windows.vm.synced_folder "${build.dir}", "${vagrant-build.dir}"
  	windows.vm.synced_folder "${reports.dir}", "${vagrant-reports.dir}"
  	windows.vm.synced_folder "${src.dir}", "${vagrant-src.dir}"
  	windows.vm.synced_folder "${lib.dir}", "${vagrant-lib.dir}"
  end
end