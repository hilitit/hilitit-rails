PORT="9002";
EMAIL="tillawy@me.com";
PASSWORD="password";
curl -v \
  --user "${EMAIL}:${PASSWORD}" \
	-H 'Content-Type: application/json' \
  -H "Accept: application/vnd.hilitit.v1" \
	http://hilit.it:${PORT}/api/sessions \
	-XPOST \
  -d ""


  #-d "{'user' : { 'email' : 'tillawy@me.com', 'password' : 'password'}}" \
