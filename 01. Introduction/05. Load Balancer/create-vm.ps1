
# Создадим сеть и подсеть
yc vpc network create `
--name cloud-eng-course `
--description "Network for excercises on 'Cloud Services Engineer' course" `

yc vpc subnet create `
--name cloud-eng-01-05 `
--description "Subnet for chapter 01.05" `
--network-name cloud-eng-course `
--range 10.0.0.0/24 `
--zone ru-central1-a `

# Создадим / удалим ВМ
yc compute instance create `
--name demo-1 `
--hostname demo-1 `
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2004-lts `
--zone ru-central1-a `
--network-interface subnet-name=cloud-eng-01-05,nat-ip-version=ipv4 `
--ssh-key "C:\Users\mikha\.ssh\id_ed25519.pub" `
--core-fraction 5 `
--preemptible `
--memory 512MB `
--metadata-from-file user-data=startup.sh

yc compute instance list

yc compute instance delete demo-2
