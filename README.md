# DevelopmentInContainers
## Bevezetés 

Előkészités

Szükségünk van egy docker image-re ami alapján létrehozhatjuk a konténereinket. Szerencsére sok már elkészitett kép közül választhatunk. Általában a DockerHUB oldalon érdemes megkeresni a megfelelő képet, de a JetBrains RubyMine csapata elkészitett egy remek példaprojectet, amiben a Dockerfile és a docker-comopse.yml is megtalálható nekünk megfeleő tartalommal, ezért azokat fogjuk használi kisebb módosításokkal.

```sh
docker-compose run web bash
gem install rails 
rails new test_app --database=postgresql

```
gem install rails

## Források
- alap image: https://github.com/JetBrains/sample_rails_app