set -e
set -u

if ! apt-cache show gir1.2-gstreamer-1.0 > /dev/null 2>&1; then
    sudo add-apt-repository --yes ppa:gstreamer-developers/ppa
fi
sudo apt-get update -qq
sudo apt-get install -qq -y \
    libgirepository1.0-dev \
    gstreamer1.0-plugins-good \
    gir1.2-clutter-1.0 \
    gir1.2-clutter-gst-2.0 \
    gir1.2-gtkclutter-1.0 \
    gir1.2-gtksource-3.0 \
    gir1.2-vte-2.90 \
    gir1.2-webkit-1.0 \
    gir1.2-webkit-3.0 \
    gir1.2-webkit2-3.0 \
    gir1.2-gsf-1 \
    gir1.2-goffice-0.10 \
    gir1.2-gnumeric\
    gnumeric\
    gnome-icon-theme \
    dbus-x11 \
    oasis
