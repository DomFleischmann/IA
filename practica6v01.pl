% FleischmannMedizinInc
% Our motto: We care about you <3

componente(antihistaminico,triprolidina).
componente(antihistaminco,ebastina).
componente(antibiotico,amoxicilina).
componente(antibiotico,ampicilina).
componente(analgesico,paracetamol).
componente(analgesico,acetilsal).
componente(antiemetico,metoclopramida).

medicamento(aspirina, acetilsal).
medicamento(iniston, triprolidina).
medicamento(clamoxil, amoxicilina).
medicamento(gelocatil, paracetamol).
medicamento(ebastel, ebastina).
medicamento(britapen, ampicilina).
medicamento(primperan, metoclopramida).


%sintoma(fiebre).
%sintoma(dolor).
%sintoma(congestionNasal).
%sintoma(congestionOcular).
%sintoma(dolorCabeza).
%sintoma(rigidezNuca).
%sintoma(dolorGarganta).
%sintoma(malestar).
%sintoma(nauseas).
%sintoma(vomitos).
%sintoma(picorNariz).

%alergia(triprolidina).
%alergia(ebastina).
%alergia(amoxicilina).
%alergia(ampicilina).
%alergia(paracetamol).
%alergia(acetilsal).
%alergia(metoclopramida).

enfermedad(alergica, rinitis).
enfermedad(bacteriana, farinigitis).
enfermedad(bacteriana, meningitis).
enfermedad(alergica, rinitis)      :- sintoma(congestionNasal), sintoma(congestionOcular), sintoma(picorNariz).
enfermedad(bacteriana, faringitis) :- sintoma(dolorGarganta), sintoma(fiebre), sintoma(malestar).
enfermedad(bacteriana, meningitis) :- sintoma(rigidezNuca), sintoma(dolorCabeza), sintoma(fiebre), (sintoma(nauseas); sintoma(vomitos)).

tratamiento(antibiotico)     :- enfermedad(bacteriana, _).
tratamiento(antihistaminico) :- enfermedad(alergica, _).

alivia(analgesico)      :- (sintoma(congestionNasal); sintoma(congestionOcular)).
alivia(antihistaminico) :- (sintoma(fiebre); sintoma(dolorCabeza); sintoma(dolorGarganta)).

recetarEnfermedad(X) :- tratamiento(Y), medicamento(X,Z), componente(Y,Z).
recetarSintomas(X)   :- alivia(Y), medicamento(X,Z),  componente(Y,Z).

%not(alergia(Z)),  not(exists(alergia(Z))),
 

pregunta(fiebre) :- write('Tiene usted fiebre?').
:- dynamic preguntado/2.
pregunta_si(C) :- confirma(C, R), respuesta_positiva(C, R).
confirma(C, R) :- preguntado(C, R).
confirma(C, R) :- \+preguntado(C, _), nl, pregunta(C), read(R), asserta(preguntado(C, R)).

respuesta_positiva(_, R) :- afirmativa(R).
respuesta_positiva(C, R) :-
	\+afirmativa(R), \+negativa(R),
	write('Conteste si/s o no/n y termine con .: '),
	read(R2),
	retract(preguntado(C, R)),
	asserta(preguntado(C, R2)),
	respuesta_positiva(C, R2).

afirmativa(sí).
afirmativa(si).
afirmativa(s).

negativa(no).
negativa(n).

