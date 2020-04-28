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

Ezután a localhost:3000 címen megtekinthető a weboldal.

A továbbiakban nem szeretnénk rögtön elinitani a rails szervert, ezért módositjuk a web szolgáltatás parancsát, hogy csak egy filet figyeljen.

```docker-compose
#docker-compose.yml

command: tail -f /dev/null
```

![alt text](images/start.png "Image")

## RubyMine
Megnyitjuk az IDE-t a projectünk mappájában. A Settings/Preferences/Languages & Frameworks/Ruby SDK and Gems
hez navigálunk. Itt a New remote gombra katiintva felugrik egy dialógus ablak beállítjuk a Docker Compose használatát, valamint a használt szolgáltatást a web -re. Az oké gombra kattintás után kiválasztjuk az új remote-ot. Ezután elkezdődik az indexelése. Ennek befejeződése után már a konténerben fejleszthetünk. Első lépésként indítsuk el a Rails servert. Az Edit Configurations menüben a Development konfigurációban állítsuk át a docker compose parancsot excec-re. Ezután a zöld nyil megnyomásakor el is indul az alaklmazásunk.

```Gemfile
#Gemfile

gem 'debase'
gem 'ruby-debug-ide'
```  

Most már elkezdhetjük tesztelni a konténert. Elösszöris az alábbi paranccsal generáljunk pár tesztoldalt.

```sh
rails g scaffold ruby_mine name:string points:integer
```

Az oldalak sikeresen létrejönnek, de mikor a host-on szerkeszteni szeretnénk, akkor problémába ütközünk. A konténerben létrehozott file-ok tulajdonosa a root user, ezért csak olvasni tudjuk, szerkeszteni nem. Megoldás lehetne, hogy chow paranccsal ezt megváltoztatjuk, de ez nem túl jó megoldás, mivel ezt mindig meg kéne tennünk, amikor új file-okat hozunk létre a konténeren belülről. Ha a konténereben létrehozunk egy új felhasznalot és azzal próbáljuk létrehozzni a file-okat akkor is hibába ütközünk, mivel igy a konténeren belül nincs root jogunk. 

## Források
- alap image: https://github.com/JetBrains/sample_rails_app
- konténeren belül létrehozott fájlok jogosultsága problémaleírás: https://jtreminio.com/blog/running-docker-containers-as-current-host-user/
- megoldás: https://www.jujens.eu/posts/en/2017/Jul/02/docker-userns-remap/