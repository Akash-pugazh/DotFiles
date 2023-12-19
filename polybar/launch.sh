# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Create a separator line in the logs
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

# Launch bar1 and log output
polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown

# Launch bar2 and log output
polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."