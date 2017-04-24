set -e
set -u

sudo apt-get update -qq
sudo apt-get install -qq -y \
   libffi6 \
   libffi-dev
