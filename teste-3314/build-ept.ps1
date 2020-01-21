. ..\env.ps1
$env:GDAL_DATA = $($env:HOMEPATH + "\AppData\Local\Continuum\miniconda3\Library\share\gdal\")
$env:PROJ_LIB = $($env:HOMEPATH + "\AppData\Local\Continuum\miniconda3\Library\share\proj\")
$inicio = Get-Date
entwine build -i $target -o $($source + '\entwine-3314') -t 3 -v --tmp $env:TMP
$termino = Get-Date
echo $termino
$duracao = $termino - $inicio
echo $('Duracao ' + $duracao.Hours + ' horas e ' + $duracao.Minutes + ' minutos!')