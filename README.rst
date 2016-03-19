===============
vagrant-jupyter
===============

Getting Started on VirtualBox
=============================

Requirements

- VirtualBox
- Vagrant

Copy Vagrantfile.local.sample file to Vagrantfile.local ,
and edit VirtualBox settings.

Then run below command, and access `<http://localhost:8888/>`__

.. code-block:: console

   $ vagrant up --provider virtualbox

If you update environment, run below command

.. code-block:: console

   $ vagrant provision

LICENSE
=======

CC0 1.0 Universal

see `LICENSE file <./LICENSE>`__
