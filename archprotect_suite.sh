#!/bin/bash

cat << "EOF"
      _                      __       _______                  _                 _      ______            _   _          
     / \                    [  |     |_   __ \                / |_              / |_  .' ____ \          (_) / |_        
    / _ \     _ .--.  .---.  | |--.    | |__) |_ .--.   .--. `| |-'.---.  .---.`| |-' | (___ \_|__   _   __ `| |-'.---.  
   / ___ \   [ `/'`\]/ /'`\] | .-. |   |  ___/[ `/'`\]/ .'`\ \| | / /__\\/ /'`\]| |    _.____`.[  | | | [  | | | / /__\\ 
 _/ /   \ \_  | |    | \__.  | | | |  _| |_    | |    | \__. || |,| \__.,| \__. | |,  | \____) || \_/ |, | | | |,| \__., 
|____| |____|[___]   '.___.'[___]|__]|_____|  [___]    '.__.' \__/ '.__.''.___.'\__/   \______.''.__.'_/[___]\__/ '.__.'
EOF

echo
echo "Hello, ArchProtect Suite is a powerful, automated security toolkit designed to simplify system hardening on Arch Linux, 
bringing essential cybersecurity tools directly to users with a single command. By automatically downloading the most reliable 
security applications, ArchProtect Suite empowers newcomers to secure their systems without in-depth knowledge, while offering 
power users the flexibility to enhance their system’s defenses effortlessly. Built for both convenience and comprehensive 
protection, ArchProtect Suite makes securing Arch Linux straightforward and highly effective for all users. Press CRTL + C to
exit at anytime."
sleep 15s
echo

# List packages.
echo "Tools included are:

- ufw (Firewall)
- fail2ban (Brute force blocker.)
- rkhunter (Rootkit scanner & removal tool.)
- auditd (System call logger and file monitor.)
- Lynis (System integrity monitor.)
- ClamAV (Antivirus)
- cryptsetup (Full disk encryption tool.)
- GnuPG (Email and file encryption tool).
- AppArmor (Application permission controller.)
- Tor (Network traffic anonymizer.)
- OpenVAS (Network vulnerability scanner.)
- btop (System monitor.)
- pkg-audit (Package vulnerability scanner.)
"
sleep 15s
echo

# Extends timout for sudo command.
read -p "Would you like to extend sudo timeout to make the installation process faster? (y/n): " timeout_extension
if [[ "$timeout_extension" == "y" || "$timeout_extension" == "Y" ]]; then
	sudo -v
fi
echo
echo "You will not be asked to enter your password for 5 minutes!"
echo

# Installation process with countdown.
echo "Starting the installation process in..."
for i in {10..1}; do
	echo "$i..."
	sleep 1
done
echo
echo "Installation of packages initiated."

sudo pacman -S ufw
echo

sudo pacman -S rkhunter
sudo rkhunter --update
echo

sudo pacman -S audit
echo

yay -S lynis
echo

yay -S tripwire
echo

sudo pacman -S ClamAV
sudo freshclam
echo

sudo pacman -S cryptsetup
echo

sudo pacman -S gnupg
echo

sudo pacman -S firejail
echo

yay -S apparmor
echo

sudo pacman -S tor
echo

yay -S opensnitch
echo

yay -S openvas
echo

sudo pacman -S btop
echo

sudo pacman -S pkg-audit
echo

echo "All tools have been installed! Please read the man pages, search on Google, or run [name of tool] --help to figure out
how to configure the tools."
echo
echo "Use 'systemctl enable [service_name]' and 'systemctl start [service_name]' for applicable tools."
echo

read -p "Would you like to exit? (y/n): " $close
if [[ "$close" == "y" || "$close" == "Y" ]]; then
exit 0
