# Processamento de Arquivos LAZ para publicação do MDS do município de São Paulo

Estamos processando uma quantidade massiva de arquivos LAZ para publicação no GeoSampa. São mais de 1,500 km2 de área com densidade de 12 ppm2. Justamente por ser um volume grande de dados precisamos nos planejar para tornar essa tarefa eficiente do ponto de vista de processamento e trabalho.

Esse repositório portanto, vai ser um guia com scripts e métodos para processar esses dados.

## Instalando os aplicativos necessários para os processamentos

Para processar esses arquivos vamos utilizar o PDAL para processar pontos e o Entwine para publicação de dados de nuvem de pontos de forma indexada e, diversas escalas

### Conda 

A forma mais fácil para instalar essas bibliotecas é através do Conda, ou melhor, do MiniConda, que pode ser baixado pelo link (https://docs.conda.io/en/latest/miniconda.html)

Depois de instalado o miniconda basta instalar o PDAL e O EntiWine pelos seguintes comandos:

`conda install pdal`

`conda install entwine`

Agora tanto o comando `pdal` quanto o comando `entwine` vão funcionar na linha de comando

Caso esteja usando um proxy é necessário configura-lo antes de executar essa instalação

### LasTools

[LasTools](https://rapidlasso.com/) é um conjunto de softwares para análises e processamentos com arquivos LiDAR e tem uma parte do código aberto, gratuíto para a maioria dos usos, como pessoais ou educacionais. É possível baixar a sua versão mais recente e é necessário para rodar parte dos processamentos propostos aqui.

## Gerando Entwine Point Tile (EPT)

O Entwine Point Tile (EPT) é um padrão de serviço estático de publicação de nuvem de pontos em um formato octo-tree, ele acaba possibilitando a análise e visualização de grandes volumes de pontos em diversas escalas de forma eficaz, armazenando arquivos em subpastas e índices, conforme descrição no site (https://entwine.io/entwine-point-tile.html). Esse formato é um padrão relativamente consolidado e pode ser utilizado por projetos como o PDAL, PoTree e Plas.io

Podemos por exemplo processar todos os arquivos LAZ da pasta `/laz/` criando uma estrutura EPT na pasta `/entwine/mds` com o seguinte comando:

`entwine build -i ./laz/ -o ./entwine/mds`

## Primeiros testes

Como primeiro teste vamos utilizar todos os 96 SCMs do setor 3314 para processar o EPT.
Vamos usar a pasta `teste-3314` com os scripts que vão gerar esse teste.

## Processamento final

Agora que já passamos pelos testes podemos partir para a execução do processamento de todos os arquivos. Para isso vamos utilizar a pasta `\scripts` nesse projeto