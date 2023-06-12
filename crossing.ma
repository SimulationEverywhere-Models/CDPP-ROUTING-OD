#include(tramo_cruce_completo.inc)

[top]
components : tramo1 tramo2 tramo3 tramo4 tramo5 cruce1 cruce2 cruce3 cruce4
components : congest2@congestion congest3@congestion od1@od

in : inNuevoAuto inNuevoCamino 
%* Puertos de entrada al modelo acoplado
link : inNuevoAuto inAuto@tramo1
link : inNuevoCamino inCamino@tramo1

% Acoplamiento Tramo1-Cruce1
link : outAuto@Tramo1 inAuto@Cruce1 
link : outCamino@Tramo1 inCamino@Cruce1 
link : outQuiereCruzar@Tramo1 inHayAuto@Cruce1
link : outHayLugarParaEntrar@Cruce1 inHayLugar@Tramo1

% Acoplamiento Cruce1-Tramo2
link : outAuto2@Cruce1 inAuto@Tramo2
link : outCamino2@Cruce1 inCamino@Tramo2
link : outPuedeSalir2@Cruce1 inPuedeEntrar@Tramo2
link : outPuedeEntrar@Tramo2 inHayLugar2@Cruce1

% Acoplamiento Cruce1-Tramo3
link : outAuto3@Cruce1 inAuto@Tramo3
link : outCamino3@Cruce1 inCamino@Tramo3
link : outPuedeSalir3@Cruce1 inPuedeEntrar@Tramo3
link : outPuedeEntrar@Tramo3 inHayLugar3@Cruce1

% Acoplamiento Cruce1-Congest2
link : outSolicitaPeso2@Cruce1 PreguntaPeso@congest2
link : peso@congest2 inPeso@Cruce1
link : peso@congest2 inPesoCamino@Cruce1
link : peso@congest2 inPesoRuteado@Cruce1

% Acoplamiento Cruce1-Congest3
link : outSolicitaPeso3@Cruce1 PreguntaPeso@congest3
link : peso@congest3 inPeso@Cruce1
link : peso@congest3 inPesoCamino@Cruce1
link : peso@congest3 inPesoRuteado@Cruce1

% Acoplamiento Cruce1-OD1
link : outSolicitaCamino@cruce1 SolicitaCamino@od1
link : InformaCamino@od1 inNuevoCamino@cruce1

% Acoplamiento Tramo2-Congest2
link : outEntraAuto@tramo2 IngresaAuto@congest2
link : outAuto@tramo2 SaleAuto@congest2

% Acoplamiento Tramo2-Congest3
link : outEntraAuto@tramo3 IngresaAuto@congest3
link : outAuto@tramo3 SaleAuto@congest3

% Acoplamiento Tramo2-Cruce2
link : outAuto@Tramo2 inAuto@Cruce2 
link : outCamino@Tramo2 inCamino@Cruce2 
link : outHayLugarParaEntrar@Cruce2 inHayLugar@Tramo2
link : outQuiereCruzar@Tramo2 inHayAuto@Cruce2

% Acoplamiento Tramo3-Cruce3
link : outAuto@Tramo3 inAuto@Cruce3
link : outCamino@Tramo3 inCamino@Cruce3 
link : outHayLugarParaEntrar@Cruce3 inHayLugar@Tramo3
link : outQuiereCruzar@Tramo3 inHayAuto@Cruce3

% Acoplamiento Cruce2-Tramo5
link : outAuto@Cruce2 inAuto@Tramo5 
link : outCamino@Cruce2 inCamino@Tramo5
link : outPuedeSalir5@Cruce2 inPuedeEntrar@Tramo5
link : outPuedeEntrar@Tramo5 inHayLugar@Cruce2

% Acoplamiento Cruce3-Tramo4
link : outAuto@Cruce3 inAuto@Tramo4 
link : outCamino@Cruce3 inCamino@Tramo4
link : outPuedeSalir4@Cruce3 inPuedeEntrar@Tramo4
link : outPuedeEntrar@Tramo4 inHayLugar@Cruce3

% Acoplamiento Tramo4-Cruce4
link : outAuto@Tramo4 inAuto4@Cruce4 
link : outCamino@Tramo4 inCamino4@Cruce4 
link : outHayLugarParaEntrar4@Cruce4 inHayLugar@Tramo4
link : outQuiereCruzar@Tramo4 inHayAuto4@Cruce4

% Acoplamiento Tramo5-Cruce4
link : outAuto@Tramo5 inAuto5@Cruce4 
link : outCamino@Tramo5 inCamino5@Cruce4 
link : outHayLugarParaEntrar5@Cruce4 inHayLugar@Tramo5
link : outQuiereCruzar@Tramo5 inHayAuto5@Cruce4


%************************************************************************************
%*******************************  TRAMO 1 *******************************************
%************************************************************************************
[tramo1]
type : cell
Width : 5
Height : 2
delay : transport
defaultDelayTime  : 10
border : nowrapped 
neighbors : tramo1(0,-1)  tramo1(0,0)  tramo1(0,1)
neighbors : tramo1(1,-1)  tramo1(1,0)  tramo1(1,1)
initialvalue : 0
localtransition : tramo-rule
in : inAuto inCamino inHayLugar 
link : inAuto inAuto@Tramo1(0,0)
link : inCamino inCamino@Tramo1(1,0)
link : inHayLugar inHayLugar@Tramo1(0,4)
link : inHayLugar inHayLugar@Tramo1(1,4)
out : outQuiereCruzar outAuto outCamino 
link : outQuiereCruzar@tramo1(0,4) outQuiereCruzar
link : outAuto@tramo1(0,4) outAuto
link : outCamino@tramo1(1,4) outCamino
zone : CaminoTramo-rule { (1,0)..(1,4) } 
portInTransition : inAuto@tramo1(0,0) IngresaAutoTramo
portInTransition : inCamino@tramo1(1,0) IngresaCaminoTramo
portInTransition : inHayLugar@tramo1(0,4) SaleACruceAuto
portInTransition : inHayLugar@tramo1(1,4) SaleACruceCamino

%************************************************************************************
%******************************* Modelos de Congestion ******************************
%************************************************************************************
[congest2]
autos: 0

[congest3]
autos: 0

%************************************************************************************
%*******************************  TRAMO 2 *******************************************
%************************************************************************************
[tramo2]
type : cell
Width : 5
Height : 2
delay : transport
defaultDelayTime  : 10
border : nowrapped 
neighbors : tramo2(0,-1)  tramo2(0,0)  tramo2(0,1)
neighbors : tramo2(1,-1)  tramo2(1,0)  tramo2(1,1)
initialvalue : 0
localtransition : tramo-rule
in : inAuto inCamino inHayLugar inPuedeEntrar
link : inPuedeEntrar inPuedeEntrar@Tramo2(0,0)
link : inAuto inAuto@Tramo2(0,0)
link : inCamino inCamino@Tramo2(1,0)
link : inHayLugar inHayLugar@Tramo2(0,4)
link : inHayLugar inHayLugar@Tramo2(1,4)
out : outQuiereCruzar outAuto outCamino outPuedeEntrar outEntraAuto
link : outPuedeEntrar@tramo2(0,0) outPuedeEntrar
link : outEntraAuto@tramo2(0,0) outEntraAuto
link : outQuiereCruzar@tramo2(0,4) outQuiereCruzar
link : outAuto@tramo2(0,4) outAuto
link : outCamino@tramo2(1,4) outCamino
zone : CaminoTramo-rule { (1,0)..(1,2) } 
zone : bacheAuto-rule { (0,3) }
zone : bacheCamino-rule { (1,3) }
zone : DespuesBacheAuto-rule { (0,4) }
zone : DespuesBacheCamino-rule { (1,4) }
portInTransition : inPuedeEntrar@tramo2(0,0) PuedeEntrarTramo
portInTransition : inAuto@tramo2(0,0) IngresaAutoTramo2
portInTransition : inCamino@tramo2(1,0) IngresaCaminoTramo
portInTransition : inHayLugar@tramo2(0,4) SaleACruceAuto
portInTransition : inHayLugar@tramo2(1,4) SaleACruceCamino

[IngresaAutoTramo2]
% Ingresa un auto al tramo (posiblemente desde un cruce)
rule : {portvalue(ThisPort) + send(outEntraAuto, 1)} 10 { portvalue(ThisPort) !=0 and (0,0) = 0 } 
rule : 0 10  { t }

[BacheAuto-rule]
% Sale hacia adelante
rule : 0 50 { not isundefined((0,1)) and  (0,0) != 0 and (0,1) = 0 } 
% Viene de atras
rule : {(0,-1)} 10 { not isUndefined((0,-1)) and (0,0) = 0  and (0,-1) !=0 } 
rule : {(0,0)} 10  { t }

[BacheCamino-rule]
% Sale hacia adelante
rule : 0 50 { not isundefined((0,1)) and  (0,0) != 0 and (0,1) = 0 } 
% Viene de atras
rule : {(0,-1)} 10 { not isUndefined((0,-1)) and (0,0) = 0  and (0,-1) != 0 } 
rule : {(0,0)} 10  { t }

[DespuesBacheAuto-rule]
% Sale hacia adelante
rule : 0 10 { not isundefined((0,1)) and  (0,0) !=0 and (0,1) = 0 } 
% Viene de atras
rule : {(0,-1)} 50 { not isUndefined((0,-1)) and (0,0) = 0  and (0,-1) !=0 } 
% Sale hacia cruce
rule : {(0,0) + send(outQuiereCruzar, 1)} 10 { not isundefined((0,-1)) and isundefined((0,1)) and  (0,0) !=0} 
rule : {(0,0)} 10  { t }

[DespuesBacheCamino-rule]
% Sale hacia adelante
rule : 0 10 { not isundefined((0,1)) and  (0,0) != 0 and (0,1) = 0 } 
% Viene de atras
rule : {(0,-1)} 50 { not isUndefined((0,-1)) and (0,0) = 0  and (0,-1) != 0 } 
rule : {(0,0)} 10  { t }


%************************************************************************************
%*******************************  TRAMO 3 *******************************************
%************************************************************************************
[tramo3]
type : cell
Width : 5
Height : 2
delay : transport
defaultDelayTime  : 10
border : nowrapped 
neighbors : tramo3(0,-1)  tramo3(0,0)  tramo3(0,1)
neighbors : tramo3(1,-1)  tramo3(1,0)  tramo3(1,1)
initialvalue : 0
initialrow : 0     0 0 0 0 0
initialrow : 1     0 0 0 0 0
localtransition : tramo-rule
in : inAuto inCamino inHayLugar inPuedeEntrar
link : inPuedeEntrar inPuedeEntrar@Tramo3(0,0)
link : inAuto inAuto@Tramo3(0,0)
link : inCamino inCamino@Tramo3(1,0)
link : inHayLugar inHayLugar@Tramo3(0,4)
link : inHayLugar inHayLugar@Tramo3(1,4)
out  : outQuiereCruzar outAuto outCamino outPuedeEntrar outEntraAuto
link : outPuedeEntrar@tramo3(0,0) outPuedeEntrar
link : outEntraAuto@tramo3(0,0) outEntraAuto
link : outQuiereCruzar@tramo3(0,4) outQuiereCruzar
link : outAuto@tramo3(0,4) outAuto
link : outCamino@tramo3(1,4) outCamino
zone : CaminoTramo-rule { (1,0)..(1,4) } 
portInTransition : inPuedeEntrar@tramo3(0,0) PuedeEntrarTramo
portInTransition : inAuto@tramo3(0,0) IngresaAutoTramo3
portInTransition : inCamino@tramo3(1,0) IngresaCaminoTramo
portInTransition : inHayLugar@tramo3(0,4) SaleACruceAuto
portInTransition : inHayLugar@tramo3(1,4) SaleACruceCamino

[IngresaAutoTramo3]
% Ingresa un auto al tramo (posiblemente desde un cruce)
rule : {portvalue(ThisPort) + send(outEntraAuto, 1)} 10 { portvalue(ThisPort) !=0 and (0,0) = 0 } 
rule : 0 10  { t }



%************************************************************************************
%*******************************  TRAMO 4 *******************************************
%************************************************************************************
[tramo4]
type : cell
Width : 5
Height : 2
delay : transport
defaultDelayTime  : 10
border : nowrapped 
neighbors : tramo4(0,-1)  tramo4(0,0)  tramo4(0,1)
neighbors : tramo4(1,-1)  tramo4(1,0)  tramo4(1,1)
initialvalue : 0
localtransition : tramo-rule
in : inAuto inCamino inHayLugar inPuedeEntrar
link : inPuedeEntrar inPuedeEntrar@Tramo4(0,0)
link : inAuto inAuto@Tramo4(0,0)
link : inCamino inCamino@Tramo4(1,0)
link : inHayLugar inHayLugar@Tramo4(0,4)
link : inHayLugar inHayLugar@Tramo4(1,4)
out  : outQuiereCruzar outAuto outCamino outPuedeEntrar
link : outPuedeEntrar@tramo4(0,0) outPuedeEntrar
link : outQuiereCruzar@tramo4(0,4) outQuiereCruzar
link : outAuto@tramo4(0,4) outAuto
link : outCamino@tramo4(1,4) outCamino
zone : CaminoTramo-rule { (1,0)..(1,4) } 
portInTransition : inPuedeEntrar@tramo4(0,0) PuedeEntrarTramo
portInTransition : inAuto@tramo4(0,0) IngresaAutoTramo
portInTransition : inCamino@tramo4(1,0) IngresaCaminoTramo
portInTransition : inHayLugar@tramo4(0,4) SaleACruceAuto
portInTransition : inHayLugar@tramo4(1,4) SaleACruceCamino


%************************************************************************************
%*******************************  TRAMO 5 *******************************************
%************************************************************************************
[tramo5]
type : cell
Width : 5
Height : 2
delay : transport
defaultDelayTime  : 10
border : nowrapped 
neighbors : tramo5(0,-1)  tramo5(0,0)  tramo5(0,1)
neighbors : tramo5(1,-1)  tramo5(1,0)  tramo5(1,1)
initialvalue : 0
localtransition : tramo-rule
in : inAuto inCamino inHayLugar inPuedeEntrar
link : inPuedeEntrar inPuedeEntrar@Tramo5(0,0)
link : inAuto inAuto@Tramo5(0,0)
link : inCamino inCamino@Tramo5(1,0)
link : inHayLugar inHayLugar@Tramo5(0,4)
link : inHayLugar inHayLugar@Tramo5(1,4)
out  : outQuiereCruzar outAuto outCamino outPuedeEntrar
link : outPuedeEntrar@tramo5(0,0) outPuedeEntrar
link : outQuiereCruzar@tramo5(0,4) outQuiereCruzar
link : outAuto@tramo5(0,4) outAuto
link : outCamino@tramo5(1,4) outCamino
zone : CaminoTramo-rule { (1,0)..(1,4) } 
portInTransition : inPuedeEntrar@tramo5(0,0) PuedeEntrarTramo
portInTransition : inAuto@tramo5(0,0) IngresaAutoTramo
portInTransition : inCamino@tramo5(1,0) IngresaCaminoTramo
portInTransition : inHayLugar@tramo5(0,4) SaleACruceAuto
portInTransition : inHayLugar@tramo5(1,4) SaleACruceCamino

%************************************************************************************
%******************************* REGLAS COMUNES A LOS TRAMOS ************************
%************************************************************************************
[PuedeEntrarTramo]
% Le indica al cruce si hay lugar para que ingrese el auto
rule : { (0,0) + send(outPuedeEntrar,0) } 10 { (0,0) = 0 } 
rule : { (0,0) + send(outPuedeEntrar,1) } 10 { (0,0) != 0 } 

[IngresaAutoTramo]
% Ingresa un auto al tramo (posiblemente desde un cruce)
rule : {portvalue(ThisPort)} 10 { portvalue(ThisPort) !=0 and (0,0) = 0 } 
rule : 0 10  { t }

[IngresaCaminoTramo]
rule : {portvalue(ThisPort)} 10 {portvalue(ThisPort) != 0 and (0,0) = 0}
rule : 0 10  { t }

[tramo-rule]
% Sale hacia adelante
rule : 0 10 { not isundefined((0,1)) and  (0,0) !=0 and (0,1) = 0 } 
% Viene de atras
rule : {(0,-1)} 10 { not isUndefined((0,-1)) and (0,0) = 0  and (0,-1) !=0 } 
% Sale hacia cruce
rule : {(0,0) + send(outQuiereCruzar, 1)} 10 { not isundefined((0,-1)) and isundefined((0,1)) and  (0,0) != 0} 
rule : {(0,0)} 10  { t }

[Caminotramo-rule]
% Sale hacia adelante
rule : 0 10 { not isundefined((0,1)) and  (0,0) != 0 and (0,1) = 0 } 
% Viene de atras
rule : {(0,-1)} 10 { not isUndefined((0,-1)) and (0,0) = 0  and (0,-1) != 0 } 
rule : {(0,0)} 10  { t }

[SaleACruceAuto]
% Sale hacia adelante (para la celda de salida)
rule : { 0 + send(outAuto,(0,0) ) } 10 { (0,0) != 0  and portvalue(ThisPort) = 0 } 
%rule : {(0,0)} 10 { (0,0) != 0  and portvalue(ThisPort) != 0 } 
rule : {(0,0)} 10  { t }
% Problema: Cuando el cruce está ocupado el tramo debería seguir preguntando 
% Por qué no lo hace?

[SaleACruceCamino]
% Sale hacia adelante (para la celda de salida)
rule : { 0 + send(outCamino,(0,0)) } 10 { (0,0) != 0 and portvalue(ThisPort) = 0 } 
rule : {(0,0)} 10  { t }

%************************************************************************************
%******************************* CRUCE 1 ********************************************
%************************************************************************************
[cruce1]
type : cell
Width : 3
Height : 5
delay : transport
defaultDelayTime  : 50
border : wrapped 
neighbors : cruce1(-4,-1) cruce1(-4,0) cruce1(-4,1) 
neighbors : cruce1(-3,-1) cruce1(-3,0) cruce1(-3,1) 
neighbors : cruce1(-2,-1) cruce1(-2,0) cruce1(-2,1) 
neighbors : cruce1(-1,-1) cruce1(-1,0) cruce1(-1,1) 
neighbors : cruce1(0,-1) cruce1(0,0) cruce1(0,1) 
neighbors : cruce1(1,-1) cruce1(1,0) cruce1(1,1) 
neighbors : cruce1(2,-1) cruce1(2,0) cruce1(2,1) 
neighbors : cruce1(3,-1) cruce1(3,0) cruce1(3,1) 
neighbors : cruce1(4,-1) cruce1(4,0) cruce1(4,1) 
initialvalue : 0
localtransition : AutoCruce1-entrada
in : inAuto inCamino inHayAuto inHayLugar2 inHayLugar3 inPeso inNuevoCamino
in : inNuevoCaminoAuto inPesoCamino inPesoRuteado
link : inAuto inAuto@Cruce1(0,0)
link : inCamino inCamino@Cruce1(1,0)
link : inAuto inAuto@Cruce1(4,0)
link : inNuevoCamino inNuevoCamino@Cruce1(0,0)
link : inNuevoCamino inNuevoCamino@Cruce1(1,0)
link : inNuevoCamino inNuevoCamino@Cruce1(4,0)
link : inHayAuto inPregunta@Cruce1(0,0)
link : inPeso inPeso@Cruce1(0,0)
link : inPesoCamino inPeso@Cruce1(1,0)
link : inPesoRuteado inPeso@Cruce1(4,0)
link : inHayLugar2 inHayLugar@Cruce1(0,1)
link : inHayLugar2 inHayLugar@Cruce1(1,1)
link : inHayLugar2 inHayLugar@Cruce1(4,1)
link : inHayLugar3 inHayLugar@Cruce1(0,2)
link : inHayLugar3 inHayLugar@Cruce1(1,2)
link : inHayLugar3 inHayLugar@Cruce1(4,2)
out : outHayLugarParaEntrar outPuedeSalir2 outAuto2 outCamino2 outPuedeSalir3 outAuto3 outCamino3
out : outSolicitaPeso2 outSolicitaPeso3 outSolicitaCamino
link : haylugar@cruce1(0,0) outHayLugarParaEntrar
link : outSolicitaPeso2@cruce1(1,0) outSolicitaPeso2
link : outSolicitaPeso3@cruce1(1,0) outSolicitaPeso3
link : outSolicitaCamino@cruce1(1,0) outSolicitaCamino
link : PuedeSalir@cruce1(0,1) outPuedeSalir2
link : auto@cruce1(0,1) outAuto2
link : camino@cruce1(1,1) outCamino2
link : PuedeSalir@cruce1(0,2) outPuedeSalir3
link : auto@cruce1(0,2) outAuto3
link : camino@cruce1(1,2) outCamino3
initialrowvalue : 2     111
initialrowvalue : 3     023
zone : AutoCruce1-entrada { (0,0) } 
zone : AutoCruce1-salida { (0,1)..(0,2) } 
zone : CaminoCruce1-entrada { (1,0) } 
zone : CaminoCruce1-salida { (1,1)..(1,2) } 
zone : idcruce-rule { (2,0)..(2,2) }
zone : idtramo-rule { (3,0)..(3,2) }
zone : RuteadoCruce1-entrada { (4,0) } 
zone : RuteadoCruce1-salida { (4,1)..(4,2) } 
portInTransition : inAuto@cruce1(0,0) IngresaAutoCruce1
portInTransition : inCamino@cruce1(1,0) IngresaCaminoCruce1
portInTransition : inAuto@cruce1(4,0) IngresaRuteadoCruce1
portInTransition : inPregunta@cruce1(0,0) QuiereCruzar
portInTransition : inHayLugar@cruce1(0,1) PuedeSalirAutoCruce1
portInTransition : inHayLugar@cruce1(0,2) PuedeSalirAutoCruce1
portInTransition : inHayLugar@cruce1(1,1) PuedeSalirCaminoCruce1
portInTransition : inHayLugar@cruce1(1,2) PuedeSalirCaminoCruce1
portInTransition : inHayLugar@cruce1(4,1) PuedeSalirRuteadoCruce1
portInTransition : inHayLugar@cruce1(4,2) PuedeSalirRuteadoCruce1
portInTransition : inPeso@cruce1(0,0) IngresaPesoAuto
portInTransition : inPeso@cruce1(1,0) IngresaPesoCamino
portInTransition : inPeso@cruce1(4,0) IngresaPesoRuteado
portInTransition : inNuevoCamino@cruce1(0,0) IngresaNuevoCaminoAuto
portInTransition : inNuevoCamino@cruce1(1,0) IngresaNuevoCamino
portInTransition : inNuevoCamino@cruce1(4,0) IngresaNuevoCaminoRuteado

[AutoCruce1-entrada]
% Elimina el auto de la simulación si ha llegado a destino 
rule : 0 10 { (0,0)!=0 and #Macro(Es_Destino) }
% Ingresa a la celda un auto que ya estaba dentro del cruce
% (sólo si ya se encuentra ruteado) *********
rule : {(0,-1)} 10 { (0,0) = 0 and (0,-1) !=0 and (4,-1) = 1 }	
% Avanza a la prox celda (sólo si está ruteado)
rule : 0 10 { (0,0) != 0 and (0,1) = 0 and (4,0) = 1 }	
rule : {(0,0)} 10  { t }

[CaminoCruce1-entrada]
% Elimina el camino de la simulación si ha llegado a destino 
rule : 0 10 { (0,0) != 0 and #Macro(Es_Destino) }
% Ingresa a la celda un camino que ya estaba dentro del cruce
% (sólo si ya se encuentra ruteado) *********
rule : {(0,-1)} 10 { (0,0) = 0 and (0,-1) > 0 and (3,-1) = 1}	
% Avanza a la prox celda (sólo si está ruteado)
rule : 0 10 { (0,0) != 0 and (0,1) = 0 and (3,0) = 1 }
rule : {(0,0)} 10  { t }

[RuteadoCruce1-entrada]
% Elimina el auto de la simulación si ha llegado a destino (la segunda condición indica si ha llegado a destino)
rule : 0 10 { (-4,0) != 0 and (-3,0) = -1 }
% Ingresa a la celda un auto que ya estaba dentro del cruce 
% (sólo si ya se encuentra ruteado) *********
rule : {(0,-1)} 10 { (-4,0) = 0 and (-4,-1) !=0 and (0,-1) = 1 }	
% Avanza a la prox celda
rule : 0 10 { (-4,0) != 0 and (-4,1) = 0 and (0,0) = 1}	
rule : {(0,0)} 10  { t }


[AutoCruce1-salida]
% Avanza el auto si no debe salir por el tramo (de acuerdo al camino)
rule : {(0,-1)} 10 { (0,0) = 0 and (0,-1) != 0 and (4,-1) = 1 and not #Macro(SalirAuto) }
% Le indica al tramo que hay un auto que puede entrar al mismo (si corresponde al camino)
rule : { 0 + send(PuedeSalir,1)} 10 { (0,0) = 0 and (0,-1) != 0 and (4,-1) = 1 and #Macro(SalirAuto) }
% Avance de un auto dentro del cruce
rule : 0 10 { (0,0) != 0 and (0,1) = 0 }
rule : {(0,0)} 10  { t }

[CaminoCruce1-salida]
% Avanza el camino si no debe salir por el tramo (de acuerdo al camino)
rule : {(0,-1)} 10 { (0,0) = 0 and (0,-1) != 0 and (3,-1) = 1 and not #Macro(SalirCamino) }
% Avance de un camino dentro del cruce
rule : 0 10 { (0,0)!=0 and (0,1) = 0 }
rule : {(0,0)} 10  { t }

[RuteadoCruce1-salida]
% Avanza el auto si no debe salir por el tramo (de acuerdo al camino)
rule : {(0,-1)} 10 { (-4,0) = 0 and (-4,-1) != 0 and (0,-1) = 1 and not (Trunc((-3,-1)) = trunc((-1,0)) ) }
% Le indica al tramo que hay un auto que puede entrar al mismo (si corresponde al camino)
rule : 0 10 { (-4,0) = 0 and (-4,-1) != 0 and (0,-1) = 1 and (Trunc((3,-1)) = trunc((1,0)) ) }
% Avance de un auto dentro del cruce
rule : 0 10 { (-4,0) != 0 and (-4,1) = 0 }
rule : {(0,0)} 10  { t }

[IngresaAutoCruce1]
% Nota: no puedo decidir acá si llegó o no a destino ya que no puedo leer
% el port que contiene el camino
rule : {portvalue(ThisPort)} 0 { (0,0) = 0 and (0,-1) = 0 and portvalue(ThisPort) !=0 }
rule : {(0,0)} 10  { t }

[IngresaCaminoCruce1]
rule : {portvalue(thisPort) + send(outSolicitaPeso2,1)} 0 { (0,0) = 0 and (0,-1) = 0 and portvalue(ThisPort) != 0  and #Macro(ProximoTramo) = 2}
rule : {portvalue(thisPort) + send(outSolicitaPeso3,1)} 0 { (0,0) = 0 and (0,-1) = 0 and portvalue(ThisPort) != 0  and (#Macro(ProximoTramo) = 3)}
rule : {(0,0)} 10 { t }

[IngresaRuteadoCruce1]
rule : 0 0 { (-4,0) = 0 and (-4,-1) = 0 and portvalue(ThisPort) !=0 }
rule : {(0,0)} 10  { t }


[IngresaPesoAuto]
%Detecta congestion en el tramo
%rule : { (0,0) } 10 { portvalue(ThisPort) >= 2}
%rule : { (0,0)*-1 } 10 { portvalue(ThisPort) < 2}
rule : {(0,0)} 10 { t }

[IngresaPesoCamino]
%Detecta congestion en el tramo
rule : { (0,0) + send(outSolicitaCamino, #Macro(ValorAOD)) } 10 {portvalue(ThisPort) >= 2}
rule :  {(0,0)} 10 { t }

[IngresaPesoRuteado]
%Detecta congestion en el tramo
rule : 1 10 {portvalue(ThisPort) < 2}
rule : {(0,0)} 10  { t }

[IngresaNuevoCamino]
rule : {portvalue(thisPort)} 10 {portvalue(ThisPort) !=0}
rule : {(0,0)} 10 { t }

[IngresaNuevoCaminoAuto]
%rule : {(0,0)*-1 } 10 {portvalue(ThisPort) !=0}
rule : {(0,0)} 10 { t }

[IngresaNuevoCaminoRuteado]
rule : 1 10 {portvalue(ThisPort) !=0}
rule : {(0,0)} 10 { t }


[PuedeSalirAutoCruce1]
% Llega auto que abandonara el cruce 
rule : {0 + send(auto,(0,-1))} 10 { (0,0) = 0 and (0,-1) != 0 and (4,-1) = 1 and portvalue(ThisPort) = 0 and #Macro(SalirAuto) } 
% Llega auto que permanecera dentro del cruce 
rule : {(0,-1) + send(auto, 0)} 10 { (0,0) = 0 and (0,-1) != 0 and (4,-1) = 1 and ( portvalue(ThisPort) = 1 or ( portvalue(ThisPort) = 0 and not #Macro(SalirAuto) )) } 
rule : {(0,0)} 10  { t }

[PuedeSalirCaminoCruce1]
% Llega auto que abandonara el cruce (no es el último tramo)
% Nota: se reemplazó la condición #Macro(NuevoCamino) != 0 por #Macro(NuevoCamino) >= 0.0001 por problemas de redondeo.
% Esta condición funciona siempre y cuando la identificación de los tramos tenga hasta 4 dígitos.
rule : {0 + send(camino,#Macro(NuevoCamino))} 10 { (0,0) = 0 and (0,-1) != 0 and (3,-1) = 1 and portvalue(ThisPort) = 0 and #Macro(SalirCamino) and #Macro(NuevoCamino) >= 0.0001} 
% Llega auto que abandonara el cruce (es el último tramo)
rule : {0 + send(camino,-1)} 10 { (0,0) = 0 and (0,-1) != 0 and (3,-1) = 1 and portvalue(ThisPort) = 0 and #Macro(SalirCamino) and #Macro(NuevoCamino) < 0.0001} 
% Llega camino que permanecera dentro del cruce 
rule : {(0,-1) + send(camino, 0)} 10 { (0,0) = 0 and (0,-1) != 0 and (3,-1) = 1 and ( portvalue(ThisPort) = 1 or ( portvalue(ThisPort) = 0 and not #Macro(SalirCamino) )) } 
rule : {(0,0)} 10  { t }

[PuedeSalirRuteadoCruce1]
% Llega auto que abandonara el cruce 
rule : 0 10 { (-4,0) = 0 and (-4,-1) != 0 and (0,-1) = 1 and portvalue(ThisPort) = 0 and (Trunc((-3,-1)) = trunc((-1,0)) ) } 
% Llega auto que permanecera dentro del cruce 
rule : {(0,-1)} 10 { (-4,0) = 0 and (-4,-1) != 0 and (0,-1) = 1 and ( portvalue(ThisPort) = 1 or ( portvalue(ThisPort) = 0 and not  (Trunc((-3,-1)) = trunc((-1,0)) ) )) } 
rule : {(0,0)} 10  { t }


%************************************************************************************
%******************************* CRUCE 2 ********************************************
%************************************************************************************

[cruce2]
type : cell
Width : 2
Height : 4
delay : transport
defaultDelayTime  : 10
border : wrapped 
neighbors : cruce2(0,-1) cruce2(0,0) cruce2(0,1) 
neighbors : cruce2(1,-1) cruce2(1,0) cruce2(1,1) 
neighbors : cruce2(2,-1) cruce2(2,0) cruce2(2,1) 
neighbors : cruce2(3,-1) cruce2(3,0) cruce2(3,1) 
initialvalue : 0
localtransition : autoCruce-entrada
in : inAuto inCamino inHayAuto inHayLugar
link : inAuto inAuto@Cruce2(0,0)
link : inCamino inCamino@Cruce2(1,0)
link : inHayAuto inPregunta@Cruce2(0,0)
%link : inHayAuto inPregunta@Cruce2(1,0)
link : inHayLugar inHayLugar@Cruce2(0,1)
link : inHayLugar inHayLugar@Cruce2(1,1)
out : outHayLugarParaEntrar outPuedeSalir5 outAuto outCamino 
link : haylugar@cruce2(0,0) outHayLugarParaEntrar
link : haylugar@cruce2(1,0) outHayLugarParaEntrar
link : PuedeSalir@cruce2(0,1) outPuedeSalir5
link : auto@cruce2(0,1) outAuto
link : camino@cruce2(1,1) outCamino
initialrowvalue : 2     22
initialrowvalue : 3     05
zone : AutoCruce-salida { (0,1) } 
zone : CaminoCruce-entrada { (1,0) } 
zone : CaminoCruce-salida { (1,1) } 
zone : idcruce-rule { (2,0)..(2,1) }
zone : idtramo-rule { (3,0)..(3,1) }
portInTransition : inAuto@cruce2(0,0) IngresaAutoCruce
portInTransition : inCamino@cruce2(1,0) IngresaCaminoCruce
portInTransition : inPregunta@cruce2(0,0) QuiereCruzar
portInTransition : inHayLugar@cruce2(0,1) PuedeSalirAutoCruce
portInTransition : inHayLugar@cruce2(1,1) PuedeSalirCaminoCruce

%*********************************************************************************
%******************************* CRUCE 3 ********************************************
%************************************************************************************

[cruce3]
type : cell
Width : 2
Height : 4
delay : transport
defaultDelayTime  : 10
border : wrapped 
neighbors : cruce3(0,-1) cruce3(0,0) cruce3(0,1) 
neighbors : cruce3(1,-1) cruce3(1,0) cruce3(1,1) 
neighbors : cruce3(2,-1) cruce3(2,0) cruce3(2,1) 
neighbors : cruce3(3,-1) cruce3(3,0) cruce3(3,1) 
initialvalue : 0
localtransition : autoCruce-entrada
in : inAuto inCamino inHayAuto inHayLugar
link : inAuto inAuto@Cruce3(0,0)
link : inCamino inCamino@Cruce3(1,0)
link : inHayAuto inPregunta@Cruce3(0,0)
%link : inHayAuto inPregunta@Cruce3(1,0)
link : inHayLugar inHayLugar@Cruce3(0,1)
link : inHayLugar inHayLugar@Cruce3(1,1)
out : outHayLugarParaEntrar outPuedeSalir4 outAuto outCamino 
link : haylugar@cruce3(0,0) outHayLugarParaEntrar
link : haylugar@cruce3(1,0) outHayLugarParaEntrar
link : PuedeSalir@cruce3(0,1) outPuedeSalir4
link : auto@cruce3(0,1) outAuto
link : camino@cruce3(1,1) outCamino
initialrowvalue : 2     33
initialrowvalue : 3     04
zone : AutoCruce-salida { (0,1) } 
zone : CaminoCruce-entrada { (1,0) } 
zone : CaminoCruce-salida { (1,1) } 
zone : idcruce-rule { (2,0)..(2,1) }
zone : idtramo-rule { (3,0)..(3,1) }
portInTransition : inAuto@cruce3(0,0) IngresaAutoCruce
portInTransition : inCamino@cruce3(1,0) IngresaCaminoCruce
portInTransition : inPregunta@cruce3(0,0) QuiereCruzar
portInTransition : inHayLugar@cruce3(0,1) PuedeSalirAutoCruce
portInTransition : inHayLugar@cruce3(1,1) PuedeSalirCaminoCruce


%************************************************************************************
%******************************* CRUCE 4 ********************************************
%************************************************************************************
[cruce4]
type : cell
Width : 2
Height : 4
delay : transport
defaultDelayTime  : 10
border : wrapped 
neighbors : cruce4(0,-1) cruce4(0,0)  cruce4(0,1)
neighbors : cruce4(1,-1) cruce4(1,0)  cruce4(1,1)
neighbors : cruce4(2,-1) cruce4(2,0)  cruce4(2,1)
neighbors : cruce4(3,-1) cruce4(3,0)  cruce4(3,1)
initialvalue : 0
localtransition : AutoCruce-entrada
in : inAuto4 inAuto5 inCamino4 inCamino5 inHayAuto4 inHayAuto5 
link : inAuto4 inAuto@Cruce4(0,0)
link : inCamino4 inCamino@Cruce4(1,0)
link : inAuto5 inAuto@Cruce4(0,1)
link : inCamino5 inCamino@Cruce4(1,1)
link : inHayAuto4 inPregunta@Cruce4(0,0)
link : inHayAuto5 inPregunta@Cruce4(0,1)
out : outHayLugarParaEntrar4 outHayLugarParaEntrar5 
link : haylugar@cruce4(0,0) outHayLugarParaEntrar4
link : haylugar@cruce4(0,1) outHayLugarParaEntrar5
initialrowvalue : 2     44
initialrowvalue : 3     00
zone : CaminoCruce-entrada { (1,0)..(1,1) } 
zone : idcruce-rule { (2,0)..(2,1) }
zone : idtramo-rule { (3,0)..(3,1) }
portInTransition : inAuto@cruce4(0,0) IngresaAutoCruce
portInTransition : inCamino@cruce4(1,0) IngresaCaminoCruce
portInTransition : inAuto@cruce4(0,1) IngresaAutoCruce
portInTransition : inCamino@cruce4(1,1) IngresaCaminoCruce
portInTransition : inPregunta@cruce4(0,0) QuiereCruzar
portInTransition : inPregunta@cruce4(0,1) QuiereCruzar



%************************************************************************************
%******************************* REGLAS COMUNES A LOS CRUCES ************************
%************************************************************************************
[QuiereCruzar]
rule : { (0,0) + send(haylugar,0) } 10 { (0,0) = 0 and (0,-1) = 0 and portvalue(ThisPort) = 1 }
rule : { (0,0) + send(HayLugar,1) } 10  { ((0,0) !=0 or ((0,0) = 0 and (0,-1) !=0)) and portvalue(ThisPort) = 1 }
rule : {(0,0)} 10  { t }

[AutoCruce-entrada]
% Elimina el auto de la simulación si ha llegado a destino 
rule : 0 10 { (0,0)!=0 and #Macro(Es_Destino) }
% Ingresa a la celda un auto que ya estaba dentro del cruce
rule : {(0,-1)} 10 { (0,0) = 0 and (0,-1) !=0 and (1,-1) != -1 }	
% Avanza a la prox celda
rule : 0 10 { (0,0) != 0 and (0,1) = 0 }	
rule : {(0,0)} 10  { t }

[CaminoCruce-entrada]
% Elimina el camino de la simulación si ha llegado a destino 
rule : 0 10 { (0,0) != 0 and (0,0) = -1 }
% Ingresa a la celda un camino que ya estaba dentro del cruce
rule : {(0,-1)} 10 { (0,0) = 0 and (0,-1) > 0 }	
% Avanza a la prox celda
rule : 0 10 { (0,0) != 0 and (0,1) = 0 }
rule : {(0,0)} 10  { t }

[AutoCruce-salida]
% Le indica al tramo que hay un auto que puede entrar al mismo (si corresponde al camino)
rule : { 0 + send(PuedeSalir,1)} 10 { (0,0) = 0 and (0,-1)!=0 and #Macro(SalirAuto) }
% Avanza el auto si no debe salir por el tramo (de acuerdo al camino)
rule : {(0,-1)} 10 { (0,0) = 0 and (0,-1)!=0 and not #Macro(SalirAuto) }
% Avance de un auto dentro del cruce
rule : 0 10 { (0,0)!=0 and (0,1) = 0 }
rule : {(0,0)} 10  { t }

[CaminoCruce-salida]
% Avanza el camino si no debe salir por el tramo (de acuerdo al camino)
rule : {(0,-1)} 10 { (0,0) = 0 and (0,-1)!=0 and not #Macro(SalirCamino) }
% Avance de un camino dentro del cruce
rule : 0 10 { (0,0)!=0 and (0,1) = 0 }
rule : {(0,0)} 10  { t }

[IngresaAutoCruce]
rule : {portvalue(ThisPort)} 10 { (0,0) = 0 and portvalue(ThisPort) != 0 }
rule : {(0,0)} 10 { t }

[IngresaCaminoCruce]
rule : {portvalue(thisPort) } 10 { (0,0) = 0 and portvalue(ThisPort) != 0}
rule : {(0,0)} 10 { t }

[PuedeSalirAutoCruce]
% Llega auto que abandonara el cruce 
rule : {0 + send(auto, (0,-1)) } 10 { (0,0) = 0 and (0,-1)!=0 and portvalue(ThisPort) = 0 and #Macro(SalirAuto) } 
% Llega auto que permanecera dentro del cruce 
rule : {0 + send(auto, 0)} 10 { (0,0) = 0 and  (0,-1)!=0 and ( portvalue(ThisPort) = 1 or ( portvalue(ThisPort) = 0 and not #Macro(SalirAuto) )) } 
rule : {(0,0)} 10  { t }

[PuedeSalirCaminoCruce]
% Llega auto que abandonara el cruce (no es el último tramo)
% Nota: se reemplazó la condición #Macro(NuevoCamino) != 0 por #Macro(NuevoCamino) >= 0.0001 por problemas de redondeo.
% Esta condición funciona siempre y cuando la identificación de los tramos tenga hasta 4 dígitos.
rule : {0 + send(camino,#Macro(NuevoCamino))} 10 { (0,0) = 0 and (0,-1) != 0 and portvalue(ThisPort) = 0 and #Macro(SalirCamino) and #Macro(NuevoCamino) >= 0.0001} 
% Llega auto que abandonara el cruce (es el último tramo)
rule : {0 + send(camino,-1)} 10 { (0,0) = 0 and (0,-1) != 0 and portvalue(ThisPort) = 0 and #Macro(SalirCamino) and #Macro(NuevoCamino) < 0.0001} 
% Llega camino que permanecera dentro del cruce 
rule : {(0,-1) + send(camino, 0)} 10 { (0,0) = 0 and (0,-1) != 0 and ( portvalue(ThisPort) = 1 or ( portvalue(ThisPort) = 0 and not #Macro(SalirCamino) )) } 
rule : {(0,0)} 10  { t }



[idcruce-rule]
rule : {(0,0)} 10  { t }

[idtramo-rule]
rule : {(0,0)} 10  { t }