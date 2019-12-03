# Processamento de Arquivos LAZ para publicação do MDS do município de São Paulo

Estamos processando uma quantidade massiva de arquivos LAZ para publicação no GeoSampa. São mais de 1,500 km2 de área com densidade de 12 ppm2. É uma quantidade massiva de dados e precisamos nos planejar para tornar essa tarefa eficiente do ponto de vista de processamento e trabalho.

Esse repositório portanto, vai ser um guia com scripts e métodos para processar esses dados.

## Instalando os aplicativos necessários para os processamentos

Para processar esses arquivos vamos utilizar o PDAL para processar pontos e o Entwine para publicação de dados de nuvem de pontos de forma indexada e, diversas escalas

### Conda 

A forma mais fácil para instalar essas bibliotecas é através do Conda, ou melhor, do MiniConda, que pode ser baixado pelo link (https://docs.conda.io/en/latest/miniconda.html)

Depois de instalado o miniconda basta instalar o PDAL e O EntiWine pelos seguintes comandos:

`conda install pdal`

`conda install entwine`

Agora tanto o comando `pdal` quanto o comando `entwine` vão funcionar na linha de comando

## Gerando Entwine Point Tile (EPT)

O Entwine Point Tile (EPT) é um padrão de disponibilização de nuvem de pontos em um formato octo-tree, ele acaba possibilitando a análise e visualização de grandes volumes de pontos em diversas escalas de forma eficaz, armazenando arquivos em subpastas e índices, conforme descrição no site (https://entwine.io/entwine-point-tile.html). Esse formato é um padrão relativamente consolidado e pode ser utilizado por projetos como o PDAL, PoTree e Plas.io

Podemos por exemplo processar todos os arquivos LAZ da pasta `/laz/` criando uma estrutura EPT na pasta `/entwine/mdt` com o seguinte comando:

`entwine build -i ./laz/ -o /entwine/mdt`


