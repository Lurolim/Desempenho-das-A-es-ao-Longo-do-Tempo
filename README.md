# Desempenho das Ações ao Longo do Tempo

<p>Este projeto tem como objetivo analisar o desempenho de 10 ações ao longo do tempo, utilizando uma base de dados em Excel com preços de fechamento ajustados por proventos. O processo inclui a importação dos dados, transformação e visualização em um gráfico utilizando o ggplot2.</p>

<p>Primeiramente, a base de dados em formato Excel, chamada <a href="https://link-para-o-arquivo-excel" target="_blank">“Dados para atividade.xlsx”</a>, foi importada para o R utilizando o pacote readxl. Após a importação, os dados foram transformados utilizando a função <code>pivot_longer</code> do pacote tidyr para empilhar os preços de ações. Uma nova coluna chamada “ticker” foi criada para armazenar o código de negociação de cada ação.</p>

<p>Os preços foram convertidos para o formato numérico, substituindo os hífens (-) por NA e transformando a coluna de datas para um formato reconhecido pelo R. As datas em que as ações não possuem dados de preços foram removidas. Em seguida, foi criada uma variável que contém os retornos diários de cada ação, agrupando as variáveis por ticker.</p>

<p>Para comparar o desempenho das ações ao longo do tempo, foi criada uma variável que representa o valor que se teria caso fosse investido R$100,00 em cada ação no primeiro dia da amostra. Este valor é atualizado diariamente com base nos retornos.</p>

<p>Por fim, foi criado um gráfico utilizando o ggplot2 para mostrar o desempenho acumulado de cada ação ao longo do tempo. O gráfico inclui um efeito de sombreamento para denotar a duração do lockdown de março de 2020 a fevereiro de 2021.</p>

<h2>Requisitos</h2>
    <ul>
        <li>R</li>
        <li>Pacotes: readxl, tidyr, dplyr, ggplot2</li>
    </ul>

<h2>Como Executar</h2>
    <ol>
        <li>Clone o repositório.</li>
        <li>Instale os pacotes necessários utilizando <code>install.packages()</code>.</li>
        <li>Baixe o arquivo Excel <a href="https://link-para-o-arquivo-excel" target="_blank">“Dados para atividade.xlsx”</a> e coloque-o no diretório do projeto.</li>
        <li>Execute o script R para importar, transformar e visualizar os dados.</li>
    </ol>
