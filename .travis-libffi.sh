set -e
set -u

echo "Install FFI libs"
sudo apt-get update -qq
sudo apt-get install -qq -y \
   libffi6 \
   libffi-dev
