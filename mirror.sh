note="# NOTE:\nTHIS REPO IS A **MIRROR** OF $1"

tmp="/tmp/mirror_script/"
mkdir "$tmp" && cd "$tmp"

git clone "$1" from
git clone "$2" to

rm -rf from/.git/config
mv to/.git/config from/.git/config

cd from

set +o noclobber
echo -e "$note\n$(cat README.md)" > README.md
cat README.md
set -o noclobber
git add README.md

git commit -m "mirror of: $1"
git push --force

rm -rf "$tmp"

