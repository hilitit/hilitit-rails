PORT="9002";
curl -v \
  --user "tillawy@me.com:password" \
	-H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
	http://hilit.it:${PORT}/api/v1/sessions/create \
	-XPOST \
  -d "" \
  -c cookie > /dev/null


  #-d "{'user' : { 'email' : 'tillawy@me.com', 'password' : 'password'}}" \
