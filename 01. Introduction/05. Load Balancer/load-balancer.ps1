# список ВМ с адресами
yc compute instance list

# создадим целевую группу (tg) для наших двух машин
yc load-balancer target-group create `
--name demo-web `
--target subnet-name=cloud-eng-01-05,address=10.0.0.34 `
--target subnet-name=cloud-eng-01-05,address=10.0.0.22

# создадим балансировщик/обработчик (nlb) для нашей целевой группы
yc load-balancer target-group list

yc load-balancer network-load-balancer create `
--name lb-demo-web `
--listener name=lb-demo-web-listener,port=80,target-port=80,external-address='' `
--target-group target-group-id=enpaff2nc7he9tbuasel,healthcheck-name=hc-demo-web,healthcheck-http-port=80

# удалим балансировщик и целевую группу
yc load-balancer nlb delete lb-demo-web
yc load-balancer tg delete demo-web