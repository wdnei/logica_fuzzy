%% Medir conforto térmico
% Autor: Wdnei Ribeiro da Paixao
%Exemplo de logica fuzzy onde é implementado um medidor de conforto térmico 
%contendo duas variaveis de controle:Umidade e Temperatura. Tendo como saida 
%o nivel de conforto térmico entre 0 e 1. 



%%gerar amostras de umidade 
% e.g. amostra1=[ umidade_relativa temperatura]
numero_amostras=10;

minimo = 5;
maximo = 100;
amostraUmidade=(maximo-minimo).*rand(numero_amostras,1) + minimo;

minimo = 0;
maximo = 45;
amostraTemperatura=(maximo-minimo).*rand(numero_amostras,1) + minimo;

amostraTotal=[amostraUmidade' ; amostraTemperatura']';

%carregar fuzzy
fuzzy_conforto=readfis('conforto_termico_fuzzy.fis');

%testar amostras
[output,IRR,ORR,ARR]=evalfis(amostraTotal,fuzzy_conforto);


%normalizar valores para mostrar no grafico
normAmostraUmidade = amostraUmidade ./ max(amostraUmidade(:));
normAmostraTemperatura = amostraTemperatura ./ max(amostraTemperatura(:));
normAmostraTotalResultado=[normAmostraUmidade' ; normAmostraTemperatura'; output']';
%mostra resultados no grafico
figure;
plot(normAmostraTotalResultado,'DisplayName','amostraTotal');
legend('Umidade','Temperatura','Nivel de Conforto');

