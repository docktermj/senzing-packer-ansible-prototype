# senzing-packer-ansible-prototype

This repository is an example of how to build machine images using [Packer](https://www.packer.io/).

In this example, a
Ubuntu 18.04 ISO image
is used to create machine images for VMware and VirtualBox.

## Build dependencies

See [build dependencies](https://github.com/docktermj/KnowledgeBase/blob/master/build-dependencies/packer.md).

## Build

Use `make help` to see targets.

### Define packer_cache directory

Optional: This defines a common place to keep large `*.iso` files for reuse across repository instances.
If not defined, a `packer_cache` directory will be created within each "packer-*" repository instance
and will not be reused across repository instances.

```console
mkdir ~/packer_cache
export PACKER_CACHE_DIR=~/packer_cache
```

### amazon-ebs preparation

#### Install aws cli

:thinking: **Optional:** The following instructions show how to install the `aws` command line interface.

1. [Installing the AWS CLI version 2 on Linux](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html)

#### Create AWS access key

An AWS access key is needed by Packer to access the account.
This information is usually kept in `~/.aws/credentials`
and is accessed by the Packer `amazon-ebs` builder.

1. Create [Access keys for CLI, SDK, & API access](https://console.aws.amazon.com/iam/home?#/security_credentials).

1. **Method #1:** Use the `aws` command line interface to create `~/.aws/credentials`.
   Supply the information when prompted.
   Example:

    ```console
    $ aws configure

    AWS Access Key ID:
    AWS Secret Access Key:
    Default region name [us-east-1]:
    Default output format [json]:
    ```

1. **Method #2:** :pencil2: Manually create a `~/.aws/credentials` file.
   Example:

    ```console
    mkdir ~/.aws

    cat <<EOT > ~/.aws/credentials
    [default]
    aws_access_key_id = AAAAAAAAAAAAAAAAAAAA
    aws_secret_access_key = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    EOT

    chmod 770 ~/.aws
    chmod 750 ~/.aws/credentials
    ```

1. References:
    1. Packer [using AWS authentication](https://www.packer.io/docs/builders/amazon/#authentication)

### Build all versions

```console
make all
```

### Build specific version

VMware

```console
make vmware-iso
```

VirtualBox

```console
make virtualbox-iso
```

## Run on VMware Workstation

1. Choose VMX file
    1. VMware Workstation > File > Open...
        1. Navigate to `.../packer-ubuntu-18.04/output-vmware-iso-nnnnnnnnnn/`
        1. Choose `packer-ubuntu-18.04-nnnnnnnnnn.vmx`
1. Optional: Change networking
    1. Navigate to VMware Workstation > My Computer > packer-ubuntu-18.04-nnnnnnnnnn
    1. Right click on "packer-ubuntu-18.04-nnnnnnnnnn" and choose "Settings"
    1. Choose "Network Adapter" > "Network Connection" > :radio_button: Bridged: Connected directly to the physical network
    1. Click "Save"
1. Run image
    1. Choose VMware Workstation > My Computer > packer-ubuntu-18.04-nnnnnnnnnn
    1. Click "Start up this guest operating system"
1. Username: vagrant  Password: vagrant

## Run on Vagrant / VirtualBox

### Add to library

```console
vagrant box add --name="packer-ubuntu-18.04-virtualbox" ./packer-ubuntu-18.04-virtualbox-nnnnnnnnnn.box
```

### Run

An example of how to run in a new directory.

#### Specify directory

In this example the `/tmp/packer-ubuntu-18.04` directory is used.

```console
export PACKER_UBUNTU_1804=/tmp/packer-ubuntu-18.04
```

#### Initialize directory

Back up an old directory and initialize new directory with Vagrant image.

```console
mv ${PACKER_UBUNTU_1804} ${PACKER_UBUNTU_1804}.$(date +%s)
mkdir ${PACKER_UBUNTU_1804}
cd ${PACKER_UBUNTU_1804}
vagrant init packer-ubuntu-18.04-virtualbox
```

#### Enable remote login

Modify Vagrantfile to allow remote login by
uncommenting `config.vm.network` in `${PACKER_UBUNTU_1804}/Vagrantfile`.
Example:

```console
sed -i.$(date +'%s') \
  -e 's/# config.vm.network \"public_network\"/config.vm.network \"public_network\"/g' \
  ${PACKER_UBUNTU_1804}/Vagrantfile
```

#### Start guest machine

```console
cd ${PACKER_UBUNTU_1804}
vagrant up
```

### Login to guest machine

```console
cd ${PACKER_UBUNTU_1804}
vagrant ssh
```

### Find guest machine IP address

In the vagrant machine, find the IP address.

```console
ip addr show
```

### Remote login to guest machine

SSH login from a remote machine.

```console
ssh vagrant@nn.nn.nn.nn
```

Password: vagrant

### Remove image from Vagrant library

To remove Vagrant image, on host machine:

```console
vagrant box remove packer-ubuntu-18.04-virtualbox
```

## References

1. [Build dependencies](https://github.com/docktermj/KnowledgeBase/blob/master/build-dependencies/packer.md).
1. [Bibliography](https://github.com/docktermj/KnowledgeBase/blob/master/bibliography/packer.md)
