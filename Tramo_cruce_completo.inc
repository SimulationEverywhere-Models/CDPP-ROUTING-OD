#BeginMacro(SalirAuto)
 (Trunc((1,-1)) = trunc((3,0)) )
#EndMacro


#BeginMacro(SalirCamino)
 (Trunc((0,-1)) = trunc((2,0)) )
#EndMacro


#BeginMacro(Es_destino)
 ( (1,0) = -1 )
#EndMacro

#BeginMacro(NuevoCamino)
 ( Fractional((0,-1)) * 10 )
#EndMacro

#BeginMacro(NuevoCamino1)
 ( Fractional((0,0)) * 10 )
#EndMacro

#BeginMacro(ProximoTramo)
 Trunc(portvalue(thisPort))
#EndMacro

#BeginMacro(ValorAOD)
 ( Trunc((0,0)) + ( Trunc((1,0)) * 0.01) + ( Trunc((-1,0)) * 0.0001) ) 
#EndMacro

