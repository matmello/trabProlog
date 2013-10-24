/* Arvore Genealogica de Familias da Mafia e simulador de combates */

:- abolish(meuPersonagem/1).

:- dynamic iniciar/1, meuPersonagem/1, oponente/1, minhaVida/1,tuaVida.

/* Debug de predicados dinamicos */

debug :- listing(iniciar), listing(meuPersonagem), listing(oponente).

/* Operadores */

:-op(900,xfx,[tem, representa,eh,equipa]).

/* Loop recursivo para limpar a tela*/

clear(0).
clear(N) :- N>0,nl,M is N-1, clear(M).

/* Cabeçalho */

cabecalho :-
        nl,
        write('Feito Utilizando SWI-Prolog'),nl,
        nl,
        write('Desenvolvedores:'),nl,
        write('Matheus Mello'),nl,
        write('Fagner Rodrigues'),nl,
        write('Edson Gomes'),nl,
        nl.

manual :-
        nl,
        write('Escolha a familia:'),nl,
        write('familia(corleone). ou familia(cordopatri).'),nl,
        nl.

/* Familias */

familia(cordopatri) :-
        nl,
        write('A familia Cordopatri foi quem espalhou a mafia para os EUA era conhecida pela alta venda de armas'),nl,
        write('Escolha agora um membro da familia:'),nl,
        write('membro(arcangeloCordopatri).'),nl,
        write('membro(giuseppinaCordopatri).'),nl,
        write('membro(mariellaCordopatri).'),nl,
        nl.

familia(corleone) :-
        nl,
        write('Familia Corleone fundada e controlada por Vito Corleone. Foi e ainda eh uma das organizacoes criminosas mais temida e poderosa de todos os tempos'),nl,
        write('Escolha agora um membro da familia:'),nl,
        write('membro(vitoCorleone).'),nl,
        write('membro(carmellaCorleone).'),nl,
        write('membro(michaelCorleone).'),nl,
        nl.

/* membros */

membro(vitoCorleone) :-
        nl,
        write('Voce eh Vito Corleone, conhecido como Don Corleone, poderoso chefao da mafia Corleone'),nl,
        write('Vito Corleone possui uma pistola Glock e 150 Pontos de Vida'),nl,
        assert(meuPersonagem(vitoCorleone)),
        oponente(cordopatri),
        nl.

membro(carmellaCorleone) :-
        nl,
        write('Voce eh Carmella Corleone, mulher e braço direitoo de Vito Corleone, tambem conhecida como chefinha'),nl,
        write('Carmela Corleone possui uma faca e 200 pontos de vida'),nl,
        assert(meuPersonagem(carmellaCorleone)),
        oponente(cordopatri),
        nl.

membro(michaelCorleone) :-
        nl,
        write('Voce eh Michael Corleone, filho de Carmella e Vito, Michael eh o menino de ouro da Mafia Corleone'),nl,
        write('Michael Corleone possui uma pistola Colt e 100 pontos de vida'),nl,
        assert(meuPersonagem(michaelCorleone)),
        oponente(cordopatri),
        nl.

membro(arcangeloCordopatri) :-
        nl,
        write('Voce eh Arcangelo Cordopatri, Italiano que aos 30 anos foi para os Estados Unidos e hoje eh conhecido como Mestre das Armas'),nl,
        write('Arcangelo Cordopatri possui uma AK-47 e 100 pontos de vida'),nl,
        assert(meuPersonagem(arcangeloCordopatri)),
        oponente(corleone),
        nl.

membro(giuseppinaCordopatri) :-
        nl,
        write('Voce eh Giuseppina Cordopatri, que ainda mantém o renomado nome da familia Cordopatri, dominando o cartel de armas na Italia'),nl,
        write('Giuseppina Cordopatri possui uma pistola Colt e 150 pontos de vida'),nl,
        assert(meuPersonagem(giuseppinaCordopatri)),
        oponente(corleone),
        nl.

membro(mariellaCordopatri) :-
        nl,
        write('Voce eh Mariella Cordopatri, irma de Arcangelo, Mariella parece nao seguir os passos do irmao e fez sua fama como organizadora do maior torneio de Luta Livre Ilegal dos EUA'),nl,
        write('Mariella Cordopatri luta com a mao e possui 300 pontos de vida'),nl,
        assert(meuPersonagem(mariellaCordopatri)),
        oponente(corleone),
        nl.

/* Equipamentos e HP*/

mariellaCordopatri equipa arma = 2.
giuseppinaCordopatri equipa arma = 3.
arcangeloCordopatri equipa arma = 4.
michaelCorleone equipa arma = 3.
carmellaCorleone equipa arma = 2.
vitoCorleone equipa arma = 4.

vitoCorleone tem vida = 150.
carmellaCorleone tem vida = 200.
michaelCorleone tem vida = 100.
arcangeloCordopatri tem vida = 100.
giuseppinaCordopatri tem vida = 150.
mariellaCordopatri tem vida = 300.

/* Gerando Oponente Randomico */

oponente(corleone) :-
        X is random(3),
        oponenteCorleone(X),!.

oponente(cordopatri) :-
        X is random(3),
        oponenteCordopatri(X),!.

/* Oponente Cordopatri */

oponenteCordopatri(0):-
        meuPersonagem(X),
        combate(X,arcangeloCordopatri).

oponenteCordopatri(1):-
        meuPersonagem(X),
        combate(X,mariellaCordopatri).

oponenteCordopatri(2):-
        meuPersonagem(X),
        combate(X,mariellaCordopatri).



/* Oponente Corleone */

oponenteCorleone(0):-
        meuPersonagem(X),
        combate(X,vitoCorleone).

oponenteCorleone(1):-
        meuPersonagem(X),
        combate(X,carmellaCorleone).

oponenteCorleone(2):-
        meuPersonagem(X),
        combate(X,michaelCorleone).

combate(X,Y):-
        sleep(5),nl,nl,
        write('O q eh isso?!?!'),nl,nl,
        sleep(2),
        write('Puff...'),nl,nl,
        sleep(2),
        write('~Alguem estah se aproximando~'),nl,nl,
        sleep(2),
        write(Y),write(':'),nl,nl,sleep(2),
        write('Ora Ora, olha quem eu encontrei!!!'),nl,nl,
        sleep(2),
        write('Prepare-se para lutar.'),nl,nl,
        X tem vida = Z,
        Y tem vida = W,
        X equipa arma = K,
        Y equipa arma = J,
        /*assert(minhaVida(Z)),*/
        /*assert(tuaVida(W)),*/
        luta(Z,K,W,J).


luta(Z,K,W,J) :-
        Z > 0, W > 0,
        Wnovo is W - ((random(25)*K) + 1),
        commenteu(Wnovo),
        Znovo is Z - ((random(25))*J + 1),
        commentvoce(Znovo),
        luta(Znovo,K,Wnovo,J).

luta(Z,_,_,_):-
        Z =< 0,
        nl,nl,write('Ohh q pena..'),nl,nl,
        sleep(2),
        write('Voce estah sem forcas para lutar mais'),nl,nl,
        sleep(3),
        write('Seu oponente percebe e te deixa fugir'),nl,nl,fim.

luta(_,_,W,_):-
        W =< 0,
        nl,nl,write('Raaaa...'),nl,nl,
        sleep(2),
        write('Voce percebe que seu oponente estah fraco demais para lutar'),nl,nl,
        sleep(2),
        write('decisao(a). para deixa-lo fugir e decisao(b). para mata-lo'),nl,nl,!.

commenteu(X):-
        X > 0,
        sleep(2),nl,nl,
        write('Voce desfere um golpe certeiro...'),nl,
        sleep(2),
        write('Seu oponente estah com '),write(X),write(' pontos de vida'),nl,nl,
        sleep(3),!.

commenteu(X):-
        X =< 0,
        sleep(2),nl,nl,
        write('Voce o atingiu brutalmente...'),nl,
        sleep(2),
        write('Seu oponente estah com '),write('1'),write(' ponto de vida'),nl,nl,
        sleep(3),!.

commentvoce(X):-
        X > 0,
        sleep(2),nl,nl,
        write('Voce tenta bloquear o ataque do seu oponente...mas falha'),nl,
        sleep(2),
        write('Voce estah com '),write(X),write(' pontos de vida'),nl,nl,
        sleep(3),!.

commentvoce(X):-
        X =< 0,
        sleep(2),nl,nl,
        write('Voce eh atingido brutalmente'),nl,
        sleep(2),
        write('Voce estah com '),write('1'),write(' ponto de vida'),nl,nl,
        sleep(3),!.




decisao(a):-
        write('Voce se aproxima de seu oponente'),nl,nl,
        sleep(2),
        write('Voce consegue sentir o medo em seus olhos'),nl,nl,
        sleep(2),
        write('Ele foge... mas parece que nunca mais ira te perseguir'),nl,nl,fim.

decisao(b):-
        write('Voce se aproxima de seu oponente'),nl,nl,
        sleep(2),
        write('Voce consegue sentir o medo em seus olhos'),nl,nl,
        sleep(2),
        write('Voce sem doh nem piedade desfere um golpe fatal... definitivamente ele nao ira mais te incomodar'),nl,nl,fim.

fim :-
sleep(3),
write('.~NNMMMMNN$.MMN. ~MM?.:MMNDNNN$    .ZMMMDNNN:.8MMD..MMM:IMMMDMMM=. '),nl,
write('   .7MMM   .MMM?+IMM?.:MM+         .ZMMD     .8MMMM:MMM:IMMM..IMM: '),nl,
write('   .7MMM   .MMMMMMMM?.:MMMMMMM=    .ZMMMMMMM..8M$DMMMMM:IMMM..+MM~ '),nl,
write('   .7MMM   .MMN..:MM?.:MM?   ..    .ZMMN  ....8M7.OMMMM:IMMM..7MN, '),nl,
write('   .7MMM   .MMN. ~MM?.:MMMMMMMN    .ZMMMMMMM+.8M7..=MMM:IMMMMMMM:. '),nl,!.




/* predicado que iniciará o programa */

start :-
        cabecalho,
        manual.

:- retractall(iniciar(_)), start.





/* BONUS */
/* Arvore Genealogica das duas familias */

/* Familia Corleone e Familia Cordopatri*/

ascendente(vitoCorleone,michaelCorleone).
ascendente(carmellaCorleone,michaelCorleone).
ascendente(vitoCorleone,sonnyCorleone).
ascendente(carmellaCorleone,sonnyCorleone).
ascendente(sonnyCorleone,dominicCorleone).
ascendente(michaelCorleone,fredoCorleone).
ascendente(arcangeloCordopatri,giuseppinaCordopatri).
ascendente(mariellaCordopatri,giuseppinaCordopatri).
ascendente(arcangeloCordopatri,francescoCordopatri).
ascendente(mariellaCordopatri,francescoCordopatri).
ascendente(giuseppinaCordopatri,avoccatoCordopatri).
acendente(francescoCordopatri,lauraCordopatri).

arcangeloCordopatri eh homem.
giuseppinaCordopatri eh mulher.
mariellaCordopatri eh mulher.
francescoCordopatri eh homem.
avoccatoCordopatri eh homem.
lauraCordopatri eh mulher.
vitoCorleone eh homem.
carmellaCorleone eh mulher.
michaelCorleone eh homem.
sonnyCorleone eh mulher.
dominicCorleone eh mulher.
fredoCorleone eh homem.


/* Regras de Genealogia */

avo_f(X,Y):- X eh mulher, ascendente(Z,Y),ascendente(X,Z).
avo_m(X,Y):- X eh homem, ascendente(Z,Y), ascendente(X,Z).
pai(X,Y):- X eh homem, ascendente(X,Y).
mae(X,Y):- X eh mulher, ascendente(X,Y).
filho(X,Y):- X eh homem, ascendente(Y,X).
filha(X,Y):- X eh mulher, ascendente(Y,X).
neto(X,Y):- X eh homem, (avo_f(Y,X);avo_m(Y,X)).
neta(X,Y):- X eh mulher, (avo_f(Y,X);avo_m(Y,X)).

