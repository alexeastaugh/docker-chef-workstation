
# Docker Chef Workstation

> Im building this so I can run a full chef workstation inside a container. Most of this is just proof of concept and learning.

Build image:

```bash
docker build -t alexeastaugh/chef-workstation .
```

Run image in a container with chef-repo mounted:

```bash
docker run -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $HOME/Dropbox/chef-repo:/chef-repo \
    alexeastaugh/chef-workstation
```