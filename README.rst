=====
sc_core
=====

Formula for managing sc base infrastructure

.. note::


    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``sc_core``
---------

Runs the states to install packages, configure sysstat / logrotate / motd / root ssh / salt patches / oom kill protection.

``sc_core.packages``
----------------

Installs and removes base packages

``sc_core.sysstat``
-----------------

Configures sysstat and a sysstat cron.

``sc_core.logrotate``
-------------------

Manages logrotate.

``sc_core.motd``
-----------------

Configures motd.

``sc_core.root_ssh``
----------------

Configures root ssh.

``sc_core.salt_patches``
---------------

Installs salt patches.

``sc_core.oom_kill_protection``
---------------

Installs and configures oom protection files.

``sc_core.cloud_generator``
---------------

Installs custom cloud providers and profiles.