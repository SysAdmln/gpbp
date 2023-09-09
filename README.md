# Unlimited Google Photos Storage at Original Quality for Sailfish OS 4.5


This script will enable unlimited storage at original quality in Google Photos
To work, you need to install OpenApps with this script [download](https://git.dmin.pro/Jolla_phone/MyJolla/raw/branch/main/open_gaps_install.sh)

<picture>
    <img
        alt="account storage"
        src="https://user-images.githubusercontent.com/90060131/238166905-6259b44b-e2ae-42f6-8d8f-ee935ca8b105.png">
</picture>
<picture>
    <img
        alt="uploaded"
        src="https://user-images.githubusercontent.com/90060131/238166914-c88adbda-55ef-4494-9437-d3c2e7b0024d.png">
</picture>

**Installation**
--
To install files:
`````
devel-su
git clone https://git.dmin.pro/Jolla_phone/gpbp
curl -sSL https://git.dmin.pro/Jolla_phone/MyJolla/raw/branch/main/open_gaps_install.sh > open_gaps_install.sh
chmod +x open_gaps_install.sh
open_gaps_install.sh
cd ./gpbp
chmod +x install.sh
install.sh
reboot phone
`````
or use a short script
`````
devel-su curl -sSL https://git.dmin.pro/Jolla_phone/MyJolla/raw/branch/main/install_gphoto_backup.sh | sh
`````