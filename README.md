# DevelopmentInContainers
## Bevezetés 

Előkészités

Szükségünk van egy docker image-re ami alapján létrehozhatjuk a konténereinket. Szerencsére sok már elkészitett kép közül választhatunk. Általában a DockerHUB oldalon érdemes megkeresni a megfelelő képet, de a JetBrains RubyMine csapata elkészitett egy remek példaprojectet, amiben a Dockerfile és a docker-comopse.yml is megtalálható nekünk megfeleő tartalommal, ezért azokat fogjuk használi kisebb módosításokkal.

Kell egy test projek is amit a tesztelés során használhatunk. Ezt is konténerből fogjuk létrehozni. A Dockerfile-ban kikommentezzük a projekt bemásolásával és a gem-ek telepitésésvel kapcsolatos részeket, majd az alábbi parancsokkal létrehozzuk a projectet. 

```sh
docker-compose run web bash
gem install rails 
rails new test_app --database=postgresql

```

Majd a konténerenből kilépés után a teljes mappa tulajdonosát átállítjuk a jelenlegi felhasználóra.

```sh
 sudo chown -R $USER .
```
Ezután a test_app/test_app mappa tartalmát simán átmásoljuk a test_app mappába. 
Az alkalmazás első futtatásakor létre kell hozni az adatbázist. Ez a web conténerből az alábbi paranccsal tehető meg.

```sh
 rake db:create
```


## Források
- alap image: https://github.com/JetBrains/sample_rails_app