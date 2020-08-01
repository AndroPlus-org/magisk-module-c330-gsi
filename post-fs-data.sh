#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}
MAGISKTMP=/sbin/.magisk
# This script will be executed in post-fs-data mode

#logcat > /data/local/catlog/logcat.txt

# NFC support
mkdir -p -m 770 /data/nfc
mkdir -p -m 770 /data/vendor/nfc
mkdir -p -m 770 /data/system/nfc

chown nfc.nfc /data/nfc
chown nfc.nfc /data/vendor/nfc
chown nfc.nfc /data/system/nfc

cp -a /system/etc/felica.cfg /data/system/nfc/felica.cfg
chown nfc.system /data/system/nfc/felica.cfg
chmod 0660 /data/system/nfc/felica.cfg

mkdir -p -m 770 /data/data/com.android.nfc/shared_prefs
chown nfc.nfc  /data/data/com.android.nfc/shared_prefs

cp -a /system/etc/NfcServicePrefs.xml /data/data/com.android.nfc/shared_prefs/NfcServicePrefs.xml
chown nfc.nfc /data/data/com.android.nfc/shared_prefs/NfcServicePrefs.xml
chmod 0660 /data/data/com.android.nfc/shared_prefs/NfcServicePrefs.xml

mkdir -p -m 777 /data/vendor/secure_element
chown system.system /data/vendor/secure_element

#Copy original file to the MODDIR
cp $MAGISKTMP/mirror/system/etc/permissions/platform.xml $MODDIR/system/etc/permissions

#Change file
sed -i 's@</permissions>@    <library name="com.felicanetworks.felicaextra"\n            file="/system/framework/com.felicanetworks.felicaextra.jar" />\n    <library name="com.felicanetworks.felica"\n            file="/system/framework/com.felicanetworks.felica.jar" />\n    <allow-in-power-save package="com.felicanetworks.mfc" />\n    <allow-in-power-save package="com.felicanetworks.mfs" />\n    <allow-in-power-save package="com.felicanetworks.mfw.a.main" />\n    <allow-in-power-save package="com.felicanetworks.mfm.main" />\n    <allow-in-data-usage-save package="com.felicanetworks.mfc" />\n    <allow-in-data-usage-save package="com.felicanetworks.mfs" />\n    <allow-in-data-usage-save package="com.felicanetworks.mfw.a.main" />\n    <allow-in-data-usage-save package="com.felicanetworks.mfm.main" />\n</permissions>@g' $MODDIR/system/etc/permissions/platform.xml

cp $MODDIR/system/etc/felica.cfg /data/system/nfc/felica.cfg
chown nfc system /data/system/nfc/felica.cfg
chmod 0660 /data/system/nfc/felica.cfg
export SYSTEMSERVERCLASSPATH=$SYSTEMSERVERCLASSPATH:/system/framework/com.felicanetworks.felicaextra.jar:/system/framework/com.felicanetworks.felica.jar

# FPS Info
chown system graphics /sys/class/graphics/fb0/measured_fps
chmod 0666 /sys/class/graphics/fb0/measured_fps
