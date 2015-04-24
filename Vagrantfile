# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Basic default configuration used for intial setup of box.
  # Please use if packaged boxes are unavailable or unwelcome
  config.vm.box = "vagrant-${os.version.prefix}${target-os.version}-${vagrant-basebox.browser.suffix}"
  config.vm.box = "http://aka.ms/vagrant-${os.version.prefix}${target-os.version}-${vagrant-basebox.browser.suffix}"

  # Box name and location
  # config.vm.box = "${vagrant-box.name}"
  #config.vm.box_url = "${vagrant-box.baseurl}/${vagrant-box.name}.box"

  # Basic network configuration
  config.vm.host_name = "${vagrant-box.name}"
  config.vm.guest = :windows

  config.vm.network :forwarded_port, guest: 3389, host: 3391, id: "winrm", auto_correct: true
  config.vm.network :forwarded_port, guest: 5985, host: 5987, id: "winrm", auto_correct: true

  config.windows.set_work_network = true

  # Tell them we are using Windows without SSH
  config.vm.communicator = "winrm"
  config.winrm.username = "IEUser"
  config.winrm.password = "Passw0rd!"

  # Share the build folder as read only
  config.vm.synced_folder "${build.dir}", "${vagrant-build.dir}"
  config.vm.synced_folder "${reports.dir}", "${vagrant-reports.dir}"
  config.vm.synced_folder "${src.dir}", "${vagrant-src.dir}"
  config.vm.synced_folder "${lib.dir}", "${vagrant-lib.dir}"

  # Shell provisioning used for intial setup of box.
  # Please use if packaged boxes are unavailable or unwelcome
  # config.vm.provision "shell", path: "provision.cmd"

  # Extend the timeout for initial connection
  config.vm.boot_timeout = 600

  config.vm.provider "virtualbox" do |vb|
    host = RbConfig::CONFIG['host_os']

	vb.gui = true
    # Give VM 3Gb system memory & access to 2 cpu cores on the host
    mem = 3072
    cpus = 2

    vb.customize ["modifyvm", :id, "--memory", mem]
    vb.customize ["modifyvm", :id, "--cpus", cpus]
  end

  config.vm.define :"${vagrant-box.name}" do |t|
    end
end
