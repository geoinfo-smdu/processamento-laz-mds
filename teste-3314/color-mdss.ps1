. ..\env.ps1
$mdss = Get-ChildItem -Path $($source + '\MDS_final\MDS_3314-*.laz')
$ortofotos = Get-ChildItem -Path $sf_source -Recurse -Include "*.tif"

foreach ($mds in $mdss) {
    $scm = $mds.BaseName.Substring($mds.BaseName.Length - 8, 8)
    $ortofoto = ($ortofotos | Select-String -InputObject {$_.FullName} -Pattern $($scm + '_RGB'))
    echo $ortofoto
    $t = $($source + '\MDS_color_' + $scm + '.laz')
    if (!(Test-Path $t)) {
        Write-Host $('Gerando ' + $t)
        lascolor -i $mds.FullName -image $ortofoto -o $t
    } else {
        Write-Host $('Arquivo ' + $target + '\MDS_color_' + $scm + '.laz já existe!')
    }
}

#lascolor -i "MDS_3431-153.laz" -image "ortho.tif" -o "destino.laz"