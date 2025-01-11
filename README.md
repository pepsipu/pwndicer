# pwndicer

## install & usage

add the `pwnenv` command to your .bashrc for quick pwn environment:

```sh
pwnenv() { docker run -it --rm --security-opt seccomp=unconfined --cap-add SYS_PTRACE -v .:/pwn pepsipu/pwn:${1:-latest}; }
```

you're done!

```sh
pwnenv # launches latest ubuntu docker
pwnenv 18.04 # launches specific ubuntu version
```
### other methods

if you're using a remote docker instance (like for those doing pwn on an apple silicon mac) you can also add this helper function to copy over your current directory contents to a remote volume
```sh
copy-to-docker-volume() {
  docker volume create $2
  docker create -v $2:/data --name helper busybox true
  docker cp $1 helper:/data
  docker rm helper
}

pwnenv() {
  docker volume rm pwn-volume
  copy-to-docker-volume . pwn-volume
  docker run -it --rm --security-opt seccomp=unconfined --cap-add SYS_PTRACE -v pwn-volume:/pwn pepsipu/pwn:${1:-latest}
}
```

you can also add this to an existing docker file (or use the command seperately to setup pwn tooling):

```dockerfile
# note that you need curl! RUN apt update && apt install curl
RUN bash -c "$(curl -fsSL https://sh.pepsi.pw/)"
```

if you prefer docker compose, you can start a pwn container with:

```sh
# PWN_DIR specifies the shared directory between the docker and host
PWN_DIR=~/ctf docker compose run pwn
```

## modding

typically, you will need to change the `FROM` at the top of the Dockerfile to match the distribution of a ctf challenge

then, rebuild with tag pepsipu/pwn (so that it overwrites the remote tag pepsipu/pwn)

```sh
docker build . --file Dockerfile --tag pepsipu/pwn:latest
```

## todo

add pwninit
