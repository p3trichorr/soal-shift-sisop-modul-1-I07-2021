#!/bash/bin

password=$(date +"%d%m%Y")

zip -r -P $password Koleksi.zip Kucing_* Kelinci_*
rm -r Kucing_* Kelinci_*
