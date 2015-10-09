PORT="9002";
curl -v \
	--user "tillawy@me.com:password" \
	-H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
	http://localhost:${PORT}/highlights.json \
  -c cookie 

