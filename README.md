# oc.postmantest
container image with postman test collections


## create a desktop using implicit `anonymous` auth

```
newman run --bail --env-var "base_url=http://localhost:30443" postman-collections/createdesktop_implicit.postman_collection.json
```
