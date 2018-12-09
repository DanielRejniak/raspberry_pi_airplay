# Airplay Install Script

This script enables to install the AirPlay client to allow Apple devices to stream audio. The script uses the 
official https://github.com/mikebrady/shairport-sync library. I also include instruction how to ensure that the airplay is available after reboot or shutdown. This means you will never have to tweak any values to get it working you just set it and forget it.

# Clone this repo into pi home directory
```
cd /home/pi
git clone <this_repo>
```
# Run the airplay script
```
cd raspberry_pi_airplay
./airplay
```
# Create boot process
This will ensure that your airplay pi will run even after the reboot.

copy the `pi_airplay_init.sh` into tht `etc/init.d/`
```
sudo cp /home/pi/pi_airplay_init.py /etc/init.d/
```
Change the permission on the shell file to executable
```
cd /etc/init.d
sudo chmod +x pi_airplay_init.sh
```
Update the rc.d script with new changes
```
cd /etc/init.d
sudo update-rc.d pi_airplay_init.sh defaults
```
Reboot
```
sudo reboot
```
