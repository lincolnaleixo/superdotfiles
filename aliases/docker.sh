# ------------------------------------
# Docker alias and function
# ------------------------------------

# Attach a docker
alias da="docker attach"

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias dim="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P --name"

# Run interactive container, e.g., $dki base /bin/bash
alias dr="docker run -d -it"
# dkdi() { docker run -i -t -P --name; }

# Run deamonized and interactive container, e.g., $dkdi base /bin/echo hello
alias dkdi="docker run -it -d -P --name"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

alias dcb="docker-compose build"

alias dcu="docker-compose up -d"

alias dcd="docker-compose down"

alias dcud="docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d"

alias dcdd="docker-compose -f docker-compose.yml -f docker-compose.dev.yml down"

alias dcup="docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d"

alias dcdp="docker-compose -f docker-compose.yml -f docker-compose.prod.yml down"

alias dcuf="docker-compose up -d --force-recreate"

alias dcs="docker-compose stop"

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dcudev=''
alias dcuprod=''

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Start all containers
dstart() { docker start $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Remove all images
dri() { docker rmi -f $(docker images -q); }

# Stop and Remove all containers and images
alias drmfi='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && dri'

# Remove all images
# drmid() { docker rmi $(docker images -f "dangling=true" -q); }

# Stop and delete a container
dsr() { docker stop $1 && docker rm $1 ; }

# Delete an image
dir() { docker image rm $1 ; }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build --compress -t=$1 .; }

# build clean with no cache
# dbuc() { echo date ; }
dbuc() { docker build --compress --no-cache -t=$1 $2; }
# alias dbuc=docker build --compress --no-cache -t

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

#get logs in real time
alias dlr='docker logs -f'

# alias docker-compose="docker run -v \"\$(pwd)\":\"\$(pwd)\" -v /var/run/docker.sock:/var/run/docker.sock -e COMPOSE_PROJECT_NAME=\$(basename \"\$(pwd)\") -ti --rm --workdir=\"\$(pwd)\" dduportal/docker-compose:latest"
# php-composer: docker run --rm -it --volume $(pwd):/app prooph/composer:7.2 install --ignore-platform-reqs
