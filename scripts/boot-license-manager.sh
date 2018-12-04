#!/bin/bash
# Create a service for the dashboard
sudo bash -c 'cat << EOF >> /etc/systemd/system/nlmdashboard.service
[Unit]
Description=Network License Manager for MATLAB Dashboard
After=network.target

[Service]
ExecStart=/usr/bin/node /mnt/licenseManagerDashboard/index.js
WorkingDirectory=/mnt/licenseManagerDashboard

[Install]
WantedBy=default.target
EOF'

# Create a service for the license manager
sudo bash -c 'cat << EOF >> /etc/systemd/system/nlm.service
[Unit]
Description=Network License Manager for MATLAB
After=network.target

[Service]
ExecStart=/mnt/matlab/etc/lmstart -u ubuntu -l /mnt/matlab/etc/glnxa64/lmlog.txt
WorkingDirectory=/mnt/matlab

[Install]
WantedBy=default.target
EOF'

echo "===Starting Network License Manager for MATLAB Dashboard==="
sudo systemctl daemon-reload
sudo systemctl start nlmdashboard.service
sudo systemctl enable nlmdashboard.service

echo "===Installing Network License Manager for MATLAB as a system service==="
# Note that we only enable it here for starting on reboot, since
# on first start we do not have the appropriate license file.
# The dashboard will start the license manager directly when the
# license file has been uploaded. From then on this service will
# start the license manager on reboot.
sudo systemctl enable nlm.service
