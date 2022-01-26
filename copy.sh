#Removing .DS_Store
find . -name '.DS_Store' -type f -delete

#Addon name
addon=ClassicAchievements

#Setting var to WoW directory
path=/mnt/d/Games/World\ of\ Warcraft/_classic_/Interface/AddOns

#Removing WoW Addon directory
rm -rf "$path/$addon"

#Creating and copying WoW Addon directory
mkdir "$path/$addon"
mv .git ../.temp
cp -rf . "$path/$addon/"
mv ../.temp .git

#Removing technical files
rm -rf "$path/$addon/.git"
rm -f "$path/$addon/copy.sh"
rm -rf "$path/$addon/textures/icons_old"

echo "Copied"