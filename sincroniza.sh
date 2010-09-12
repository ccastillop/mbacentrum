DESTINO="ccastillo@mbacentrum.com:/home/ccastillo/apps/mbacentrum.com"
if test $1 = "go"
then
echo "sincronizando relojes pero de verdad "
#le digo al servidor que reinicie el servicio de nuevosecom
touch tmp/restart.txt
rsync -azvr --force --delete --exclude-from=rsync_exclude.txt ./ $DESTINO
else
echo "haciendo la finta que sincronizo para ver qué pasa A $DESTINO"
rsync -azvr --force --delete --dry-run --exclude-from=rsync_exclude.txt ./ $DESTINO
fi

#ejecuto comando remoto para iniciar el server
ssh -A ccastillo@mbacentrum.com '/home/ccastillo/apps/mbacentrum.com/deploy.sh'
curl -s "http://mbacentrum.com"

