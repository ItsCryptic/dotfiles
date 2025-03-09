(...)  # Script header and initial setup

# File created with https://nattdf.streamlit.app/

# System Upgrade
color_echo "blue" "Performing system upgrade... This may take a while..."
dnf upgrade -y

# System Config
# Set the system hostname to uniquely identify the machine on the network
color_echo "yellow" "Setting hostname..."
hostnamectl set-hostname kevins-pc

# Optimize DNF package manager for faster downloads and efficient updates
color_echo "yellow" "Configuring DNF Package Manager..."
backup_file "/etc/dnf/dnf.conf"
echo "max_parallel_downloads=10" | tee -a /etc/dnf/dnf.conf > /dev/null
dnf -y install dnf-plugins-core

# Enable and configure automatic system updates to enhance security and stability
color_echo "yellow" "Enabling DNF autoupdate..."
dnf install dnf-automatic -y
sed -i 's/apply_updates = no/apply_updates = yes/' /etc/dnf/automatic.conf
systemctl enable --now dnf-automatic.timer

# Replace Fedora Flatpak Repo with Flathub for better package management and apps stability
color_echo "yellow" "Replacing Fedora Flatpak Repo with Flathub..."
dnf install -y flatpak
flatpak remote-delete fedora --force || true
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak repair
flatpak update

# Check and apply firmware updates to improve hardware compatibility and performance
color_echo "yellow" "Checking for firmware updates..."
fwupdmgr refresh --force
fwupdmgr get-updates
fwupdmgr update -y

# Enable RPM Fusion repositories to access additional software packages and codecs
color_echo "yellow" "Enabling RPM Fusion repositories..."
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf group update core -y

# Install multimedia codecs to enhance multimedia capabilities
color_echo "yellow" "Installing multimedia codecs..."
dnf swap ffmpeg-free ffmpeg --allowerasing -y
dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
dnf update @sound-and-video -y

# Install Hardware Accelerated Codecs for AMD GPUs. This improves video playback and encoding performance on systems with AMD graphics.
color_echo "yellow" "Installing AMD Hardware Accelerated Codecs..."
dnf swap mesa-va-drivers mesa-va-drivers-freeworld -y
dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld -y

# Install virtualization tools to enable virtual machines and containerization
color_echo "yellow" "Installing virtualization tools..."
dnf install -y @virtualization

# Configure power settings to prevent system sleep and hibernation
color_echo "yellow" "Configuring power settings..."
sudo -u $ACTUAL_USER gsettings set org.gnome.desktop.session idle-delay 0
sudo -u $ACTUAL_USER gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
sudo -u $ACTUAL_USER gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
sudo -u $ACTUAL_USER gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
sudo -u $ACTUAL_USER gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0
sudo -u $ACTUAL_USER gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'suspend'


# App Install
# Install essential applications
color_echo "yellow" "Installing essential applications..."
dnf install -y inxi fastfetch unzip unrar git wget curl
color_echo "green" "Essential applications installed successfully."

# Install Internet & Communication applications
color_echo "yellow" "Installing Brave..."
dnf install -y dnf-plugins-core
if command -v dnf4 &>/dev/null; then
  dnf4 config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
else
  dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
fi
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
dnf install -y brave-browser
color_echo "green" "Brave installed successfully."
color_echo "yellow" "Installing Discord..."
flatpak install -y flathub com.discordapp.Discord
color_echo "green" "Discord installed successfully."

# Install Office Productivity applications
color_echo "yellow" "Installing Bitwarden..."
flatpak install -y flathub com.bitwarden.desktop
color_echo "green" "Bitwarden installed successfully."

# Install Media & Graphics applications
color_echo "yellow" "Installing Spotify..."
flatpak install -y flathub com.spotify.Client
color_echo "green" "Spotify installed successfully."
color_echo "yellow" "Installing GIMP..."
dnf install -y gimp
color_echo "green" "GIMP installed successfully."
color_echo "yellow" "Installing OBS Studio..."
flatpak install -y flathub com.obsproject.Studio
color_echo "green" "OBS Studio installed successfully."

# Install Gaming & Emulation applications
color_echo "yellow" "Installing Steam..."
flatpak install -y flathub com.valvesoftware.Steam
color_echo "green" "Steam installed successfully."
color_echo "yellow" "Installing Lutris..."
flatpak install -y flathub net.lutris.Lutris
color_echo "green" "Lutris installed successfully."
color_echo "yellow" "Installing Heroic Games Launcher..."
flatpak install -y flathub com.heroicgameslauncher.hgl
color_echo "green" "Heroic Games Launcher installed successfully."
color_echo "yellow" "Installing Dolphin..."
flatpak install -y flathub org.DolphinEmu.dolphin-emu
color_echo "green" "Dolphin installed successfully."

# Install Remote Networking applications
color_echo "yellow" "Installing RustDesk..."
flatpak install -y flathub com.rustdesk.RustDesk
color_echo "green" "RustDesk installed successfully."

# Install File Sharing & Download applications
color_echo "yellow" "Installing qBittorrent..."
dnf install -y qbittorrent
color_echo "green" "qBittorrent installed successfully."

# Install System Tools applications
color_echo "yellow" "Installing Mission Center..."
flatpak install -y flathub io.missioncenter.MissionCenter
color_echo "green" "Mission Center installed successfully."
color_echo "yellow" "Installing Flatseal..."
flatpak install -y flathub com.github.tchx84.Flatseal
color_echo "green" "Flatseal installed successfully."
color_echo "yellow" "Installing Bottles..."
flatpak install -y flathub com.usebottles.bottles
color_echo "green" "Bottles installed successfully."


# Customization
# Install Microsoft Windows fonts (core)
color_echo "yellow" "Installing Microsoft Fonts (core)..."
dnf install -y curl cabextract xorg-x11-font-utils fontconfig
rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
color_echo "green" "Microsoft Fonts (core) installed successfully."

# Install Google fonts collection
color_echo "yellow" "Installing Google Fonts..."
wget -O /tmp/google-fonts.zip https://github.com/google/fonts/archive/main.zip
mkdir -p $ACTUAL_HOME/.local/share/fonts/google
unzip /tmp/google-fonts.zip -d $ACTUAL_HOME/.local/share/fonts/google
rm -f /tmp/google-fonts.zip
fc-cache -fv
color_echo "green" "Google Fonts installed successfully."

# Install Adobe fonts collection
color_echo "yellow" "Installing Adobe Fonts..."
mkdir -p $ACTUAL_HOME/.local/share/fonts/adobe-fonts
git clone --depth 1 https://github.com/adobe-fonts/source-sans.git $ACTUAL_HOME/.local/share/fonts/adobe-fonts/source-sans
git clone --depth 1 https://github.com/adobe-fonts/source-serif.git $ACTUAL_HOME/.local/share/fonts/adobe-fonts/source-serif
git clone --depth 1 https://github.com/adobe-fonts/source-code-pro.git $ACTUAL_HOME/.local/share/fonts/adobe-fonts/source-code-pro
fc-cache -f
color_echo "green" "Adobe Fonts installed successfully."

# Custom Script
# Custom user-defined commands
echo "Created with ❤️ for Open Source"

(...)  # Script footer
