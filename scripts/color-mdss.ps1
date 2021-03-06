# Script para coloris os arquivos LiDAR com as dimensões de RGB obtidas a partir das ortofotos de 2017

. ..\env.ps1
$mdss = Get-ChildItem -Path $($source + '\MDS_final\*.laz')
$ortofotos = Get-ChildItem -Path $sf_source -Recurse -Include "*.tif"

foreach ($mds in $mdss) {
    $scm = $mds.BaseName.Substring($mds.BaseName.Length - 8, 8)
    $ortofoto = ($ortofotos | Select-String -InputObject {$_.FullName} -Pattern $($scm + '_RGB'))
    echo $ortofoto
    $t = $($target_color + '\MDS_color_' + $scm + '.laz')
    if (!(Test-Path $t)) {
        Write-Host $('Gerando ' + $t)
        if ($ortofoto) {
            lascolor -i $mds.FullName -image $ortofoto -o $t
        } else {
            # incluindo folhas com escala de 1:5000
            Write-Host $('Buscando Folha 1:5000: ' + $t)
            $ortofoto = ($ortofotos | Select-String -InputObject {$_.FullName} -Pattern $($scm.Substring(0,6) + '_RGB'))
            lascolor -i $mds.FullName -image $ortofoto -o $t
        }
    } else {
        Write-Host $('Arquivo ' + $target_color + '\MDS_color_' + $scm + '.laz já existe!')
    }
}

#lascolor -i "MDS_3431-153.laz" -image "ortho.tif" -o "destino.laz"