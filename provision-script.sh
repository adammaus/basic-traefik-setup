# Install any updates
sudo apt-get -f install
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y

# Install base software
sudo apt-get -y install vim curl build-essential software-properties-common git language-pack-en-base ca-certificates wget openssl mcrypt cifs-utils dos2unix unattended-upgrades imagemagick unzip python3-pip

# Install Docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Set up LetsEncrypt directory for SSL
cd ~;
mkdir letsencrypt;
touch letsencrypt/acme.json;
chmod 600 letsencrypt/acme.json;

# Set up directory for repo
git config --global init.defaultBranch main
mkdir traefik