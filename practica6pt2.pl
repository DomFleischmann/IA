estado_reloj(Id,Capacidad,CantidadL1, CantidadL2).

estado(1,420,420,0).
estado(2,660,660,0).

estado_final(estado(X,Y,180,_)).
estado_final(estado(X,Y,_,180)).

girar(estado(X,Y,Z,W)) :- estado(X,Y,W,Z).

estado_valido(estado
