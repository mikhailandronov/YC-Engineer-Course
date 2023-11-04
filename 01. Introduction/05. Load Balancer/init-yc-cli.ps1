# Установка YC CLI и создание профиля
# https://cloud.yandex.ru/docs/cli/quickstart

iex (New-Object System.Net.WebClient).DownloadString('https://storage.yandexcloud.net/yandexcloud-yc/install.ps1')
yc init
yc config list

# Аутентификация от имени сервисного аккаунта
# https://cloud.yandex.ru/docs/cli/operations/authentication/service-account
yc iam service-account --folder-id <ID_каталога> list
yc iam key create --service-account-name <Имя аккаунта> --output key.json --folder-id <ID_каталога>
yc config profile create yc-engineer
yc config set service-account-key key.json
yc config set folder-id b1gq61dh0r1q44r04cqv
yc config list
