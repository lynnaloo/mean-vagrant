## Creating a M.E.A.N. Vagrant Virtual Development Environment ##

### Vagrant ###

[Vagrant](http://docs.vagrantup.com/v2/why-vagrant/index.html) is open-source software used to create lightweight and portable virtual development environments. Vagrant works like a "wrapper" for VirtualBox that can create, configure, and destroy virtual machines with the use of its own terminal commands. Vagrant facilitates the setup of environments without any direct interaction with VirtualBox and allows developers to use preferred editors and browsers in their native operating system. [This blog](http://mitchellh.com/the-tao-of-vagrant) describes a typical workflow using Vagrant in a development environment.

### MEAN Stack ###

[MEAN](http://mean.io) is a boilerplate that provides a nice starting point for [MongoDB](http://www.mongodb.org/), [Node.js](http://www.nodejs.org/), [Express](http://expressjs.com/), and [AngularJS](http://angularjs.org/) based applications. It is designed to give you quick and organized way to start developing of MEAN based web apps with useful modules like mongoose and passport pre-bundled and configured. We mainly try to take care of the connection points between existing popular frameworks and solve common integration problems.  

###  Install Vagrant ###

* Download and install [VirtualBox 4.3.12](https://www.virtualbox.org/wiki/Downloads)
* Download and install [Vagrant 1.6.4](https://www.vagrantup.com/downloads.html)

#### Windows Users ####

- Download [Git for Windows](http://msysgit.github.io/):
  - Run the installer and "next" through the wizard until the step to adjust your PATH environment.
  - Choose the third option, "Run Git and included tools from within the Windows Command prompt"
  - **Important**: On the next step, "Configuring the line ending conversions", choose the second option:       "Checkout as-is, commit Unix-style line endings".
  - Choose "next" through any additional steps to complete the Git for Windows install.
  - Open the Windows Command Prompt as **Administrator**
 
### Get the Code

[Fork](https://github.com/linnovate/mean/fork) the `mean` and [fork](http://github.com/lynnaloo/mean-vagrant) the  `mean-vagrant` repositories on Github.

Clone your forks of the `mean` repositories to a directory on your host machine:

    git clone https://github.com/<username>/mean.git
    git clone --recursive https://github.com/<username>/mean-vagrant.git

Change directory to your `mean-vagrant` directory:
    cd mean-vagrant

### Setup Vagrant ###

Once you `cd` into the mean-vagrant directory, you will find a "Vagrantfile" which will provide
the necessary instructions and provisioning to setup your MEAN virtual machine. All Vagrant commands
should be performed in this directory with your Vagrantfile.

*Note: In the `Vagrantfile`, ensure that the `source` variable to matches a path of the cloned Mean source code
relative to the Vagrantfile:* `source = "../mean"`

### Install VirtualBox Guest Additions Plugin

    vagrant plugin install vagrant-vbguest

### Connect to the Virtual Machine ###

Start the virtual machine:

    vagrant up

Connect to the virtual machine via ssh:

    vagrant ssh

- The MEAN source code is synced to the folder `~/mean`

Start the Mean server using grunt:

    cd mean
    grunt

Launch your local browser and navigate to `http://localhost:3000`

