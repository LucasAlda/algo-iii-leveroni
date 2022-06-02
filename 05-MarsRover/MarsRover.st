!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRoverAtOriginPointingNorth marsRoverNotAtOriginAtPointingSouth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'setUp' stamp: 'LA 6/2/2022 15:51:51'!
setUp
	
	marsRoverAtOriginPointingNorth := MarsRover at: 0@0 pointing: DirectionNorth new.
	
	marsRoverNotAtOriginAtPointingSouth := MarsRover at: 0@1 pointing: DirectionSouth new.
	! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'LA 6/2/2022 15:38:24'!
assertMarsRover: aMarsRover PointsTo: aDirection

	self assert: aMarsRover direction equals: aDirection! !

!MarsRoverTest methodsFor: 'assertions' stamp: 'LA 6/2/2022 15:38:19'!
assertMarsRover: aMarsRover PositionIs: aPosition

	self assert: aMarsRover position equals: aPosition ! !


!MarsRoverTest methodsFor: 'private' stamp: 'LA 6/2/2022 15:34:11'!
moveMarsRoverBackwards: aMarsRover

	^ aMarsRover followInstructions: 'b'! !

!MarsRoverTest methodsFor: 'private' stamp: 'LA 6/2/2022 15:45:06'!
moveMarsRoverFoward: aMarsRover

	^ aMarsRover followInstructions: 'f'! !

!MarsRoverTest methodsFor: 'private' stamp: 'LA 6/2/2022 15:45:14'!
rotateMarsRoverLeft: aMarsRover

	^ aMarsRover followInstructions: 'l'! !

!MarsRoverTest methodsFor: 'private' stamp: 'LA 6/2/2022 15:45:11'!
rotateMarsRoverRight: aMarsRover

	^ aMarsRover followInstructions: 'r'! !


!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:38:14'!
test01AMarsRoverStartsAtOriginCoordinatesPointingNorth
	
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 0@0.
	self assert: marsRoverAtOriginPointingNorth direction equals: #DirectionNorth.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:53:00'!
test02AMarsRoverStartsAtAnyPositionPointingAnyDirection
	
	self assertMarsRover: marsRoverNotAtOriginAtPointingSouth PositionIs: 0@1.
	self assertMarsRover: marsRoverNotAtOriginAtPointingSouth PointsTo: #DirectionSouth.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:40:31'!
test03AMarsRoverDoesNothingWhenItReceivesEmptyInstructions

	marsRoverAtOriginPointingNorth followInstructions: ''.
	
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 0@0.
	self assertMarsRover: marsRoverAtOriginPointingNorth PointsTo: #DirectionNorth.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:52:33'!
test04AMarsRoverCanMoveFowardWhenInstructed

	self moveMarsRoverFoward: marsRoverAtOriginPointingNorth.	
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 0@1.
	
	self moveMarsRoverFoward: marsRoverNotAtOriginAtPointingSouth.	
	self assertMarsRover: marsRoverNotAtOriginAtPointingSouth PositionIs: 0@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:53:28'!
test05AMarsRoverCanMoveBackwardsWhenInstructed

	self moveMarsRoverBackwards: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 0@-1.
	
	self moveMarsRoverBackwards: marsRoverNotAtOriginAtPointingSouth .
	self assertMarsRover: marsRoverNotAtOriginAtPointingSouth PositionIs: 0@2.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:46:37'!
test06AMarsRoverCanMoveFowardAndBackwardsMultipleTimes
	
	self moveMarsRoverFoward: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 0@1.
	
	self moveMarsRoverFoward: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 0@2.
	
	self moveMarsRoverBackwards: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 0@1.
	
	self moveMarsRoverBackwards: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 0@0.
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:50:33'!
test07AMarsRoverCanRotateRightAndMoveInThatDirectionWhenInstructed
	
	self rotateMarsRoverRight: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PointsTo: #DirectionEast.
	
	self moveMarsRoverFoward: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 1@0.
	
	self moveMarsRoverBackwards: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 0@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:50:37'!
test08AMarsRoverCanRotateLeftAndMoveInThatDirectionWhenInstructed

	self rotateMarsRoverLeft: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PointsTo: #DirectionWest.
	
	self moveMarsRoverFoward: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: -1@0.
	
	self moveMarsRoverBackwards: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 0@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:47:57'!
test09AMarsRoverCanRotateLeftAndRightMultipleTimes
	
	self rotateMarsRoverLeft: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PointsTo: #DirectionWest.
	
	self rotateMarsRoverLeft: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PointsTo: #DirectionSouth.
	
	self rotateMarsRoverRight: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PointsTo: #DirectionWest.
	
	self rotateMarsRoverRight: marsRoverAtOriginPointingNorth.
	self assertMarsRover: marsRoverAtOriginPointingNorth PointsTo: #DirectionNorth.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:48:06'!
test10AMarsRoverCanReceiveMultipleInstructionsAtTheSameTime
	
	marsRoverAtOriginPointingNorth followInstructions: 'fflb'.
	
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: 1@2! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:49:23'!
test11AMarsRoverShouldRaiseAnErrorOnAInvalidInstruction
	
	self should: [marsRoverAtOriginPointingNorth followInstructions: 'x'.] 
		raise: Error 
		withMessageText: MarsRover invalidInstructionDescription.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 6/2/2022 15:49:26'!
test12AMarsRoverShouldCompleteAllInstructionsBeforeAnInvalidOne
	
	self should:[marsRoverAtOriginPointingNorth followInstructions: 'frbxb'.] 
		raise: Error 
		withMessageText: MarsRover invalidInstructionDescription.
	
	self assertMarsRover: marsRoverAtOriginPointingNorth PositionIs: -1@1! !


!classDefinition: #Direction category: 'MarsRover'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Direction methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:18:55'!
name

	self subclassResponsibility.! !

!Direction methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:18:41'!
nextDirectionClockwise 
	
	self subclassResponsibility! !

!Direction methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:18:21'!
nextDirectionCounterclockwise
	
	self subclassResponsibility! !

!Direction methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:18:58'!
versor

	self subclassResponsibility.! !


!classDefinition: #DirectionEast category: 'MarsRover'!
Direction subclass: #DirectionEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!DirectionEast methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:15:31'!
name

	^#DirectionEast! !

!DirectionEast methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:18:41'!
nextDirectionClockwise

	^DirectionSouth new! !

!DirectionEast methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:18:21'!
nextDirectionCounterclockwise

	^DirectionNorth new! !

!DirectionEast methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:09:35'!
versor

	^1@0! !


!classDefinition: #DirectionNorth category: 'MarsRover'!
Direction subclass: #DirectionNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!DirectionNorth methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:15:43'!
name

	^#DirectionNorth! !

!DirectionNorth methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:18:41'!
nextDirectionClockwise

	^DirectionEast new! !

!DirectionNorth methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:18:21'!
nextDirectionCounterclockwise

	^DirectionWest new! !

!DirectionNorth methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:09:28'!
versor

	^0@1! !


!classDefinition: #DirectionSouth category: 'MarsRover'!
Direction subclass: #DirectionSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!DirectionSouth methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:16:28'!
name

	^#DirectionSouth! !

!DirectionSouth methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:18:41'!
nextDirectionClockwise

	^DirectionWest new! !

!DirectionSouth methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:18:21'!
nextDirectionCounterclockwise

	^DirectionEast new! !

!DirectionSouth methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:09:55'!
versor

	^0@-1! !


!classDefinition: #DirectionWest category: 'MarsRover'!
Direction subclass: #DirectionWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!DirectionWest methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:16:36'!
name

	^#DirectionWest! !

!DirectionWest methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:18:41'!
nextDirectionClockwise

	^DirectionNorth new! !

!DirectionWest methodsFor: 'basic operations' stamp: 'LA 5/30/2022 21:18:21'!
nextDirectionCounterclockwise

	^DirectionSouth new! !

!DirectionWest methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:10:01'!
versor

	^-1@0! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'LA 6/2/2022 15:22:12'!
initializeAt: aPosition pointing: aDirection

	position := aPosition.
	direction := aDirection.! !


!MarsRover methodsFor: 'private - instructions' stamp: 'LA 5/30/2022 21:28:05'!
isInstructionMoveBackwards: anInstructionCommand
	
	^anInstructionCommand = $b! !

!MarsRover methodsFor: 'private - instructions' stamp: 'LA 5/30/2022 21:28:14'!
isInstructionMoveFoward: anInstructionCommand
	
	^anInstructionCommand = $f! !

!MarsRover methodsFor: 'private - instructions' stamp: 'LA 5/30/2022 21:28:23'!
isInstructionRotateLeft: anInstructionCommand
	
	^anInstructionCommand = $l! !

!MarsRover methodsFor: 'private - instructions' stamp: 'LA 5/30/2022 21:28:28'!
isInstructionRotateRight: anInstructionCommand
	
	^anInstructionCommand = $r! !

!MarsRover methodsFor: 'private - instructions' stamp: 'BB 5/28/2022 19:33:45'!
moveBackwards
	
	^self move: direction versor negated! !

!MarsRover methodsFor: 'private - instructions' stamp: 'BB 5/28/2022 19:33:55'!
moveFoward

	^self move: direction versor! !

!MarsRover methodsFor: 'private - instructions' stamp: 'LA 5/30/2022 21:18:21'!
rotateLeft
	
	^direction:= direction nextDirectionCounterclockwise! !

!MarsRover methodsFor: 'private - instructions' stamp: 'LA 5/30/2022 21:18:41'!
rotateRight
	
	^direction:= direction nextDirectionClockwise! !


!MarsRover methodsFor: 'private' stamp: 'LA 5/30/2022 21:29:49'!
followInstruction: anInstructionCommand 
	
	(self isInstructionMoveFoward: anInstructionCommand) ifTrue: [^ self moveFoward ].
	(self isInstructionMoveBackwards: anInstructionCommand) ifTrue: [^ self moveBackwards ].
	(self isInstructionRotateLeft: anInstructionCommand) ifTrue: [^ self rotateLeft ].
	(self isInstructionRotateRight: anInstructionCommand) ifTrue: [^ self rotateRight ].	
	
	self error: self class invalidInstructionDescription.! !

!MarsRover methodsFor: 'private' stamp: 'BB 5/28/2022 19:34:12'!
move: aVersor
	
	^position := position translatedBy: aVersor! !


!MarsRover methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:37:15'!
direction
	
	^direction name! !

!MarsRover methodsFor: 'basic operations' stamp: 'BB 5/28/2022 18:24:10'!
followInstructions: aSetOfInstructions 
	
	aSetOfInstructions do: [:character | self followInstruction: character ].
	! !

!MarsRover methodsFor: 'basic operations' stamp: 'BB 5/28/2022 16:03:04'!
position
	
	^position ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error messages' stamp: 'LA 6/2/2022 15:21:33'!
at: aPosition pointing: aDirection

	^self new initializeAt: aPosition pointing: aDirection ! !

!MarsRover class methodsFor: 'error messages' stamp: 'BB 5/28/2022 18:42:32'!
invalidInstructionDescription
	^'Invalid Instruction Received!!'! !
