. ..\env.ps1
$env:GDAL_DATA = $($env:HOMEPATH + "\AppData\Local\Continuum\miniconda3\Library\share\gdal\")
$env:PROJ_LIB = $($env:HOMEPATH + "\AppData\Local\Continuum\miniconda3\Library\share\proj\")
$inicio = Get-Date
foreach ($i in 1..187) {
    echo "************************************************************************************"
    echo $("*************" + $i + " de 187 **********************************************************")
    echo "************************************************************************************"
    entwine build -i $target -o $($source + '\entwine') -t 3 -v --tmp $($source + '\tmp') --run 30 #--force false #--subset 4 4 
}
#entwine build -i $target -o $($source + '\entwine') -t 3 -v --tmp $($source + '\tmp') --run 3 #--subset 4 4 
$termino = Get-Date
echo $termino
$duracao = $termino - $inicio
echo $('Duracao ' + $duracao.Hours + ' horas e ' + $duracao.Minutes + ' minutos!')

#entwine.exe merge --output $($source + '\entwine-3314') --threads 3
# https://potree.entwine.io/data/view.html?r="http://localhost:8080"