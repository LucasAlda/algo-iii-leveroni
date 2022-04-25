!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: 'firmaGenetica alimento'!

!AvispaOriana class methodsFor: 'publico' stamp: 'LA 4/25/2022 11:29:07'!
firmaGenetica
	^firmaGenetica! !

!AvispaOriana class methodsFor: 'publico' stamp: 'LA 4/25/2022 12:54:48'!
intentarReproducirse
	(Habitat cantidadDelRecurso: alimento) > 0 ifTrue: [
		Habitat agregarHuevoDeAvispa: firmaGenetica.
		Habitat  quitarRecurso: alimento.
	]
	! !


!AvispaOriana class methodsFor: '--** private fileout/in **--' stamp: 'LA 4/25/2022 13:05:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	firmaGenetica := FirmaGeneticaOrianaYOrnella.
	alimento := Oruga.! !


!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: ''!

!AvispaLara class methodsFor: 'publico' stamp: 'LA 4/25/2022 12:08:09'!
intentarReproducirse 
	| pudoRobar hayHuevosFirmaGeneticaOrianaYOrnella hayHuevosFirmaGeneticaPolly |
	
	pudoRobar := false.
	hayHuevosFirmaGeneticaOrianaYOrnella := (Habitat cantidadDeHuevosConLaFirmaGenetica: FirmaGeneticaOrianaYOrnella) > 0.
	hayHuevosFirmaGeneticaPolly := (Habitat cantidadDeHuevosConLaFirmaGenetica: FirmaGeneticaPolly) > 0.
	
	hayHuevosFirmaGeneticaOrianaYOrnella ifTrue: [ 
		pudoRobar := true.
		Habitat  quitarHuevoDeAvispa: FirmaGeneticaOrianaYOrnella
	].

	(hayHuevosFirmaGeneticaPolly and: (pudoRobar = false)) ifTrue: [
		pudoRobar := true.
		Habitat  quitarHuevoDeAvispa: FirmaGeneticaPolly.
	].

	pudoRobar ifTrue: [
		Habitat agregarHuevoDeAvispa: firmaGenetica.	
	].
! !


!AvispaLara class methodsFor: '--** private fileout/in **--' stamp: 'LA 4/25/2022 13:05:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	firmaGenetica := FirmaGeneticaLara.
	alimento := nil.! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOrnella class' category: 'AvispasYAbejasParte2'!
AvispaOrnella class
	instanceVariableNames: ''!

!AvispaOrnella class methodsFor: '--** private fileout/in **--' stamp: 'LA 4/25/2022 13:05:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	firmaGenetica := FirmaGeneticaOrianaYOrnella.
	alimento := Oruga.! !


!classDefinition: #AvispaPolly category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejasParte2'!
AvispaPolly class
	instanceVariableNames: ''!


!AvispaPolly class methodsFor: '--** private fileout/in **--' stamp: 'LA 4/25/2022 13:05:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	firmaGenetica := FirmaGeneticaPolly.
	alimento := Polilla.! !


!classDefinition: #FirmaGeneticaOrianaYOrnella category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #FirmaGeneticaOrianaYOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #FirmaGeneticaLara category: 'AvispasYAbejasParte2'!
FirmaGeneticaOrianaYOrnella subclass: #FirmaGeneticaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #FirmaGeneticaPolly category: 'AvispasYAbejasParte2'!
FirmaGeneticaOrianaYOrnella subclass: #FirmaGeneticaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #Habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AvispasYAbejasParte2'!
Habitat class
	instanceVariableNames: 'cantidadDeHuevosConFirmaGenetica cantidadDeRecursos'!

!Habitat class methodsFor: 'huevos' stamp: 'LA 4/25/2022 12:08:09'!
agregarHuevoDeAvispa: firmaGenetica
	| cantidadActualDeHuevosConLaFirmaGenetica |
	 cantidadActualDeHuevosConLaFirmaGenetica := self cantidadDeHuevosConLaFirmaGenetica: firmaGenetica.
	
	cantidadDeHuevosConFirmaGenetica at: firmaGenetica put: cantidadActualDeHuevosConLaFirmaGenetica + 1

		! !

!Habitat class methodsFor: 'huevos' stamp: 'LA 4/25/2022 11:23:44'!
cantidadDeHuevosConLaFirmaGenetica: firmaGenetica
 	^cantidadDeHuevosConFirmaGenetica at: firmaGenetica ifAbsent: [0].! !

!Habitat class methodsFor: 'huevos' stamp: 'LA 4/25/2022 12:08:24'!
cantidadDeHuevosDeAvispa
	^cantidadDeHuevosConFirmaGenetica values sum: [ : cantidad | cantidad ] ifEmpty: [ 0 ].! !

!Habitat class methodsFor: 'huevos' stamp: 'LA 4/25/2022 11:55:27'!
quitarHuevoDeAvispa: firmaGenetica
	| cantidadActualDeHuevosConLaFirmaGenetica |
	 cantidadActualDeHuevosConLaFirmaGenetica := self cantidadDeHuevosConLaFirmaGenetica: firmaGenetica.
	
	cantidadActualDeHuevosConLaFirmaGenetica > 0 ifTrue: [
		cantidadDeHuevosConFirmaGenetica at: firmaGenetica put: cantidadActualDeHuevosConLaFirmaGenetica - 1
	]
	

		! !


!Habitat class methodsFor: 'recursos' stamp: 'LA 4/25/2022 12:48:30'!
agregarRecurso: recurso
	| cantidadActualDelRecurso |
	 cantidadActualDelRecurso := self cantidadDelRecurso: recurso.
	
	cantidadDeRecursos at: recurso put: cantidadActualDelRecurso + 1

		! !

!Habitat class methodsFor: 'recursos' stamp: 'LA 4/25/2022 12:48:58'!
cantidadDelRecurso: recurso
 	^cantidadDeRecursos at: recurso ifAbsent: [0].! !

!Habitat class methodsFor: 'recursos' stamp: 'LA 4/25/2022 12:50:42'!
quitarRecurso: recurso
	| cantidadActualDelRecurso |
	 cantidadActualDelRecurso := self cantidadDelRecurso: recurso.
	
	cantidadActualDelRecurso > 0 ifTrue: [
		cantidadDeRecursos at: recurso put: cantidadActualDelRecurso - 1
	]
	

		! !


!Habitat class methodsFor: 'recursos - oruga' stamp: 'LA 4/25/2022 13:01:12'!
cantidadDeOrugas
	^self cantidadDelRecurso: Oruga.! !


!Habitat class methodsFor: 'recursos - polillas' stamp: 'LA 4/25/2022 13:00:20'!
cantidadDePolillas
	^self cantidadDelRecurso: Polilla.! !


!Habitat class methodsFor: 'reguladores' stamp: 'LA 4/25/2022 12:46:35'!
retrocederAlInicioDeLosTiempos
	cantidadDeHuevosConFirmaGenetica := Dictionary new.
	cantidadDeRecursos := Dictionary new.! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'LA 4/25/2022 13:05:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosConFirmaGenetica := ((Dictionary new) add: (FirmaGeneticaPolly->1); yourself).
	cantidadDeRecursos := ((Dictionary new) add: (Oruga->99); add: (Polilla->98); yourself).! !


!classDefinition: #Oruga category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Oruga
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #Polilla category: 'AvispasYAbejasParte2'!
Oruga subclass: #Polilla
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'LA 4/25/2022 12:08:25'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispa isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'LA 4/25/2022 12:08:25'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispa isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'LA 4/25/2022 12:08:25'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispa isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'LA 4/25/2022 12:08:24'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispa isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'LA 4/25/2022 12:08:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispa isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'LA 4/25/2022 12:08:25'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispa isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'LA 4/25/2022 12:08:25'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispa isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'LA 4/25/2022 12:08:25'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispa isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/25/2022 11:58:05'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat cantidadDeHuevosConLaFirmaGenetica: self laAvispaLara firmaGenetica.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/25/2022 11:28:44'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat cantidadDeHuevosConLaFirmaGenetica: self laAvispaOriana firmaGenetica.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/25/2022 11:29:52'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat cantidadDeHuevosConLaFirmaGenetica: self laAvispaOrnella firmaGenetica.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/25/2022 11:30:02'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat cantidadDeHuevosConLaFirmaGenetica: self laAvispaPolly firmaGenetica.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/21/2022 19:42:12'!
habitat
	^Habitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/25/2022 12:56:06'!
hacerQueElHabitatTengaLosRecursosSuficientes
	99 timesRepeat: [self habitat  agregarRecurso: Oruga ].
	99 timesRepeat: [self habitat  agregarRecurso: Polilla ].
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/25/2022 11:56:00'!
laAvispaLara
	^AvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/21/2022 19:43:18'!
laAvispaOriana
	^AvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/21/2022 20:25:03'!
laAvispaOrnella
	^AvispaOrnella .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/21/2022 20:52:30'!
laAvispaPolly
	^AvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/25/2022 12:56:24'!
queElHabitatTengaDosOrugasMas
	self habitat agregarRecurso: Oruga.
	self habitat agregarRecurso: Oruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/25/2022 12:56:44'!
queElHabitatTengaDosPolillasMas
	self habitat agregarRecurso: Polilla.
	self habitat agregarRecurso: Polilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/25/2022 12:56:53'!
queElHabitatTengaUnaOrugaMas
	self habitat agregarRecurso: Oruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/25/2022 12:56:57'!
queElHabitatTengaUnaPolillaMas
	self habitat agregarRecurso: Polilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'LA 4/21/2022 20:00:24'!
retrocederElHabitatAlInicioDeLosTiempos
	Habitat retrocederAlInicioDeLosTiempos! !

AvispaOriana initializeAfterFileIn!
AvispaLara initializeAfterFileIn!
AvispaOrnella initializeAfterFileIn!
AvispaPolly initializeAfterFileIn!
Habitat initializeAfterFileIn!