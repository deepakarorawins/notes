#!/bin/sh

# Set project path dynamically
project_path="$HOME/.appium/node_modules/appium-xcuitest-driver/node_modules/appium-webdriveragent/WebDriverAgent.xcodeproj"
project_dir=$(dirname "$project_path")

# Validate project existence
if [ ! -d "$project_path" ]; then
    echo "❌ WebDriverAgent.xcodeproj not found at expected location:"
    echo "$project_path"
    exit 1
fi

# Check dependencies
if ! command -v idevice_id >/dev/null 2>&1; then
    echo "❌ 'idevice_id' not found. Install via: brew install libimobiledevice"
    exit 1
fi

# Fetch connected real iOS device UDIDs
devices_file="devices_list.txt"
rm -f "$devices_file"

idevice_id -l > "$devices_file"

if [ ! -s "$devices_file" ]; then
    echo "❌ No physically connected iOS devices found."
    exit 1
fi

# Map UDIDs to device names using idevicename
echo "Connected iOS Devices:"
i=1
rm -f device_index.txt

while IFS= read -r udid; do
    name=$(idevicename -u "$udid" 2>/dev/null)
    if [ -z "$name" ]; then
        name="Unknown_Device"
    fi
    echo "$i) $name [$udid]"
    echo "$i|$name|$udid" >> device_index.txt
    i=$((i+1))
done < "$devices_file"

# User selection
echo ""
echo "Options:"
echo "A) Run on ALL devices"
echo "S) Select devices manually (by number or partial name)"
printf "Enter choice (A/S): "
read choice

selected_devices=""

if [ "$choice" = "A" ] || [ "$choice" = "a" ]; then
    selected_devices=$(cut -d'|' -f3 device_index.txt)
else
    printf "Enter device numbers or name fragments (comma-separated): "
    read selection

    IFS=','

    for input in $selection; do
        input=$(echo "$input" | sed 's/^ *//;s/ *$//')  # trim spaces

        while IFS= read -r line; do
            index=$(echo "$line" | cut -d'|' -f1)
            name=$(echo "$line" | cut -d'|' -f2)
            udid=$(echo "$line" | cut -d'|' -f3)

            if [ "$input" = "$index" ]; then
                selected_devices="$selected_devices $udid"
            else
                echo "$name" | grep -i "$input" >/dev/null 2>&1
                if [ $? -eq 0 ]; then
                    selected_devices="$selected_devices $udid"
                fi
            fi
        done < device_index.txt
    done
fi

if [ -z "$selected_devices" ]; then
    echo "❌ No devices selected. Exiting."
    rm -f "$devices_file" device_index.txt
    exit 1
fi

# Run builds in parallel
for udid in $selected_devices; do
    echo "🚀 Starting build on device: $udid"
    (
        cd "$project_dir" || exit 1

        xcodebuild -project WebDriverAgent.xcodeproj \
                   -scheme WebDriverAgentRunner \
                   -destination "id=$udid" \
                   build | tee "build_log_$udid.txt"

        echo "✅ Build completed for device: $udid"
    ) &
done

wait
echo "🎉 All builds completed."

# Cleanup
rm -f "$devices_file" device_index.txt
