SERVICE="$1"
if systemctl is-active --quiet "$SERVICE"
then
echo "$SERVICE is running"
else
echo "$SERVICE is stopped. Restarting..."
sudo systemctl restart "$SERVICE"
echo "Restart attempted"
fi
