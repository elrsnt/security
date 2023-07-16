#!/bin/sh

# Check if ClamAV is installed
if [ -f /usr/bin/clamscan ]; then
  echo "ClamAV is installed."
else
  echo "ClamAV is not installed, please install before run this script."
fi


# Validate the path to the script

PATH="$HOME/scripts/clamav.sh"

if [ ! -f "$PATH" ]; then
  echo "The path to the script does not exist."
  exit 1
fi

# Update ClamAV virus definitions
/usr/bin/freshclam

# Make a scan of the entire system
/usr/bin/clamscan /

# Schedule the script to run weekly
#crontab -e

# Add the following line to the crontab file:
#0 19 * * 0 "$1"
# Once you have added the new entry to the crontab file, it will start running according to the schedule that you specified.

#Here are some of the possible values for the minute, hour, day, month, and weekday fields:

#Minute: The minute of the hour. Valid values are 0-59.
#Hour: The hour of the day. Valid values are 0-23.
#Day: The day of the month. Valid values are 1-31.
#Month: The month of the year. Valid values are 1-12.
#Weekday: The day of the week. Valid values are 0-6, where 0 is Sunday and 6 is Saturday. 
#
