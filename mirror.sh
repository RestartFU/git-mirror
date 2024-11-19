shopt -s expand_aliases
source .env

note="# Mirror:\nThis repository is a <u>**mirror**</u> of [$1](this repository)"

tmp="/tmp/mirror_script/"
rm -rf "$tmp" && mkdir "$tmp" && cd "$tmp"

echo "\n[*] Cloning source repository..."
git clone "$1" from #|| echo "\n[x] Could not clone source repository" && exit
echo "\n[*] Cloned source repository."

echo "\n[*] Cloning destination repository..."
git clone "$2" to #|| echo "[x] Could not clone destination repository" && exit
echo "\n[*] Cloned destination repository."

rm -rf from/.git/config
mv to/.git/config from/.git/config

cd from

set +o noclobber
echo "$note\n$(cat README.md)" > README.md
set -o noclobber
git add README.md

git commit -m "mirror of: $1"
git push --force #|| echo "\n[x] Could not force push to destination repository" && exit
echo "\n[*] Pushed to destination repository."

rm -rf "$tmp"

