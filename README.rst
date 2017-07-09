QT docker development environment
=================================

Overview
++++++++

This docker image is intended to provide a development environment for Qt.
It contains *qtcreator* as well as the Qt libraries and tools (such as
qmake etc.)

The Qt libraries and *qtcreator* are built from source with the script
*build_qt.sh*. The source is obtained from the official Qt git repositories.

Installation
++++++++++++

See the official docker documentation for a general overview of docker
and how to install:

https://docs.docker.com/engine/installation/linux/

Build and launch docker image
+++++++++++++++++++++++++++++

Build the docker image
----------------------

.. code-block:: bash

	git clone https://github.com/erstrom/docker-qt.git
	cd docker-qt
	./docker-build.sh

During the build process, *build_qt.sh* will clone the Qt git repos and
build the versions specified by **QT_VERSION** and **QT_CREATOR_VERSION**.
If you want other versions than the default, just update *Dockerfile* with
the desired versions (must be valid git tags in the repo's).

Create a container
------------------

Use ``docker run`` to create a container. Two wrapper scripts are included
that can be used to ease the creation of containers:

- *docker_run_shell.sh*
- *docker_run_qtcreator.sh*

*docker_run_shell.sh* creates a container and sets docker *COMMAND* to the
default bash shell. This is useful if the container is going to be customized.

*docker_run_qtcreator.sh* sets docker *COMMAND* to *qtcreator*. This will
launch *qtcreator* as soon as the container is started.

The wrapper scripts invokes ``docker run`` with a few options that makes
it possible for GUI applications inside the container (like *qtcreator*)
to connect to the xorg server on the host.

Start an existing container
---------------------------

``docker run`` should only be run once, so if you want to restart an already
created container you should use ``docker start``.

The below two wrapper scripts exist for ``docker start``:

- *docker_start_shell.sh*
- *docker_start_qtcreator.sh*

The scripts will (re)start the containers created by the *docker_run_...* scripts,
i.e., *docker_start_qtcreator.sh* will start the container created by
*docker_run_qtcreator.sh*.

