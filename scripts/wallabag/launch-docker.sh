docker run -v /opt/wallabag/data:/var/www/wallabag/data -v /opt/wallabag/images:/var/www/wallabag/web/assets/images -p 127.0.0.1:8080:80 -e "SYMFONY__ENV__DOMAIN_NAME=https://news.162536.xyz" -e "SYMFONY__ENV__FOSUSER_REGISTRATION=false" -e "SYMFONY__ENV__SECRET=this_is_a_new_secret_ABAOVMAJ" wallabag/wallabag