## Angular App

### Requirements

#### ChefDK

ChefDK includes several utilities for creating and managing chef resources.  To install it, navigate [here](https://docs.chef.io/install_dk.html#get-package-run-installer) and complete the ___Get Package, Run Installer___ and ___Set System Ruby___ sections.

#### VirtualBox / Vagrant

VirtualBox and Vagrant will provide you with a virtual machine to provision using this cookbook.  You can download VirtualBox [here](https://www.virtualbox.org/wiki/Downloads) and Vagrant [here](https://www.vagrantup.com/downloads.html).

Once those are installed, install a couple of vagrant chef plugins:

```bash
$ vagrant plugin install vagrant-berkshelf
```

### Development

After installing `vagrant` and the chef plugins, you can start a vagrant vm by running:

```bash
$ cd chef
$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
    default: The Berkshelf shelf is at "/Users/user/.berkshelf/vagrant-berkshelf/shelves/berkshelf20160506-3919-1cap0ms-default"
==> default: Sharing cookbooks with VM
==> default: Importing base box 'ubuntu/xenial64'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'ubuntu/xenial64' is up to date...
...
```

This will initialize the cookobook submodule, create a default `.config.json` (if it doesn't already exist), and start a VirtualBox vm using the cookbook to provision it.  Most importantly, this shares the `angularapp` directory with the vm.  Any changes made to files within this directory are mirrored in the coupled OS.

### Work Flow

Once the vm is up and running, you can ssh in to start a development server:

```bash
$ cd chef
$ vagrant ssh
$ cd angularapp/angularapp
$ npm start

> angularapp@0.0.0 start /home/ubuntu/angularapp/angularapp
> ng serve --host 0.0.0.0

** NG Live Development Server is listening on 0.0.0.0:8000, open your browser on http://localhost:8000 **
Hash: 8578fdcb4b8c426fb2ec
Time: 13697ms
chunk    {0} polyfills.bundle.js, polyfills.bundle.js.map (polyfills) 177 kB {4} [initial] [rendered]
chunk    {1} main.bundle.js, main.bundle.js.map (main) 5.28 kB {3} [initial] [rendered]
chunk    {2} styles.bundle.js, styles.bundle.js.map (styles) 10.7 kB {4} [initial] [rendered]
chunk    {3} vendor.bundle.js, vendor.bundle.js.map (vendor) 2.19 MB [initial] [rendered]
chunk    {4} inline.bundle.js, inline.bundle.js.map (inline) 0 bytes [entry] [rendered]
webpack: Compiled successfully.
```
