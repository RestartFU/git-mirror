ARRAY=( 
	"git.restartfu.com/restart/gophig:github.com/restartfu/gophig"
	"git.restartfu.com/restart/otp:github.com/restartfu/otp-cli"
	"git.restartfu.com/restart/git-mirror:github.com/restartfu/git-mirror"
)

while :
do
	for repo in "${ARRAY[@]}" ; do
    		FROM=${repo%%:*}
    		TO=${repo#*:}
    		echo "mirroring $FROM to $TO"
		./mirror.sh "https://$FROM" "https://$TO"
		sleep 10
	done
	sleep 3000
done
