<div align="center">    
 
## Análise Estatística em Marketing Digital
#### Trabalho de Conclusão de Curso apresentado como parte dos requisitos para a obtenção do título de Bacharel em Estatística pela Universidade de São Paulo – USP.


</div>

<!-- TODO: Add video -->

### Domínio de aplicação


 <div text-align="justify" align="justify">    

Em campanhas de marketing digital, estamos interessados em gerar conversões por meio da divulgação de conteúdo nas mídias sociais. Entende-se por conversão a influência sobre um determinado público-alvo para que realize uma ação, como comprar produtos, contratar serviços ou criar vínculo de fidelidade. Em outras palavras, trata-se de qualquer ação que o cliente de um negócio deseje como resultado da divulgação.
</div>
O uso das ferramentas de mídias sociais está atrelado a diversas métricas de desempenho (por exemplo, alcance, cliques, tempo de retenção e interações com o material), todas associadas ao processo conhecido como funil de conversão — assim chamado devido à diminuição progressiva do número de usuários em cada etapa do processo.
</div>
Em cada camada do funil, diferentes combinações de métricas são configuradas como metas dentro das plataformas de campanha. O valor investido por meta é estimado pelas plataformas, mas o atingimento dessa meta pode ou não ocorrer. De forma resumida, avalia-se o desempenho de determinada métrica comparando o resultado alcançado com o estimado. Com base nessa avaliação, a divulgação pode ser descontinuada, ajustada ou substituída.
</div>
Portanto, o estudo apresentado neste documento contempla a análise do impacto das mídias digitais no faturamento total, bem como o desenvolvimento e a seleção de modelos de regressão capazes de realizar predições do faturamento com base nas métricas e investimentos realizados em cada mídia.
</div>


### Conteúdo da base de dados
 <div text-align="justify" align="justify">    
Os dados utilizados neste trabalho descrevem métricas de divulgação de conteúdo associadas ao faturamento obtido por meio das conversões. Cada mídia (Google, Facebook, Instagram e TikTok) possui sua própria plataforma, com métricas e investimentos específicos.
</div>
Os dados referem-se a um cliente real da agência de marketing digital Raccoon, portanto, todas as referências diretas ao cliente, como os nomes das campanhas, foram omitidas para preservar a confidencialidade e a unicidade das tuplas nas tabelas. Com exceção da substituição da identidade do cliente, os demais procedimentos de pré-processamento e tratamento dos dados — como formatação, remoção de valores NaN e eliminação de tuplas duplicadas — foram mantidos e estão detalhados no tópico correspondente.


</div>

### Resultado
 <div text-align="justify" align="justify">    
As análises permitiram verificar como as ações de marketing influenciam diretamente a receita das marcas, possibilitando a elaboração de uma curva de tendência condizente com a realidade observada. Além disso, foi possível identificar as principais métricas com maior impacto no faturamento, contribuindo para decisões mais estratégicas na alocação de recursos de mídia.


  &nbsp;
<div align="center" >   
 
![image](https://github.com/RogerMarcondes/Analise_Regressao_Multivariada/blob/4ec3a69ff13f38a368ce4a286a9f17277f195427/AnaliseExploratoriaRegressaoMultiplaPython/trend.png)

</div>


Como resumido no material: [`Apresentação.pdf`](./Apresentação.pdf)

</div>

<!-- TODO: Add video -->

## Conteúdo do projeto

 - [`Apresentação.pdf`](./Apresentação.pdf) - Apresentação completa, com todas as informações:
    - Motivação do problema
    - Métodos de coleta e limpeza dos dados
    - Análise exploratória e estudo de correlação das variáveis
    - Desenvolvimento e execução dos modelos
    - Avaliação de resultados. 
 - [`AnaliseExploratoriaR\`](./AnaliseExploratariaR/) - Repositório do projeto baseado em R para análise exploratória e experimentação dos modelos de regressão 
 - [`AnaliseExploratoriaRegressaoMultiplaPython\`](./AnaliseExploratoriaRegressaoMultiplaPython/) - Repositório do projeto baseado em Python para análise exploratória, limpeza de dados, kfolds dos modelos de regressão, com aplicação dos métodos de avaliação de modelo VIF 


### Como Executar

#### Dependências
 -  R>=3.5
 -  JupiterNotebook>=6.0.0
