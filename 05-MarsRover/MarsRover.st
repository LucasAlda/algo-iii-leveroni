!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'setUp' stamp: 'LA 5/30/2022 21:37:15'!
setUp
	
	marsRover := MarsRover new.! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'LA 5/30/2022 21:44:00'!
assertMarsRoverPointsTo: aDirection

	self assert: marsRover direction equals: aDirection! !

!MarsRoverTest methodsFor: 'assertions' stamp: 'LA 5/30/2022 21:41:29'!
assertMarsRoverPositionIs: aPosition

	self assert: marsRover position equals: aPosition ! !


!MarsRoverTest methodsFor: 'private' stamp: 'LA 5/30/2022 21:39:01'!
moveMarsRoverBackwards

	^ marsRover followInstructions: 'b'! !

!MarsRoverTest methodsFor: 'private' stamp: 'LA 5/30/2022 21:38:40'!
moveMarsRoverFoward

	^ marsRover followInstructions: 'f'! !

!MarsRoverTest methodsFor: 'private' stamp: 'LA 5/30/2022 21:39:53'!
rotateMarsRoverLeft

	^ marsRover followInstructions: 'l'! !

!MarsRoverTest methodsFor: 'private' stamp: 'LA 5/30/2022 21:39:34'!
rotateMarsRoverRight

	^ marsRover followInstructions: 'r'! !


!MarsRoverTest methodsFor: 'tests' stamp: 'LA 5/30/2022 21:41:51'!
test01AMarsRoverStartsAtOriginCoordinatesPointingNorth
	
	self assertMarsRoverPositionIs: 0@0.
	self assert: marsRover direction equals: #DirectionNorth.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 5/30/2022 21:42:01'!
test02AMarsRoverDoesNothingWhenItReceivesEmptyInstructions

	marsRover followInstructions: ''.
	
	self assertMarsRoverPositionIs: 0@0! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 5/30/2022 21:42:06'!
test03AMarsRoverCanMoveFowardWhenInstructedToDoSo

	self moveMarsRoverFoward.
	
	self assertMarsRoverPositionIs: 0@1! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 5/30/2022 21:42:10'!
test04AMarsRoverCanMoveBackwardsWhenInstructedToDoSo

	self moveMarsRoverBackwards.
	
	self assertMarsRoverPositionIs: 0@-1! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 5/30/2022 21:42:25'!
test05AMarsRoverCanMoveFowardAndBackwardsMultipleTimes
	
	self moveMarsRoverFoward.
	self assertMarsRoverPositionIs: 0@1.
	
	self moveMarsRoverFoward.
	self assertMarsRoverPositionIs: 0@2.
	
	self moveMarsRoverBackwards.
	self assertMarsRoverPositionIs: 0@1.
	
	self moveMarsRoverBackwards.
	self assertMarsRoverPositionIs: 0@0.
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 5/30/2022 21:44:21'!
test06AMarsRoverCanRotateRightAndMoveInThatDirectionWhenInstructedToDoSo
	
	self rotateMarsRoverRight.
	self assertMarsRoverPointsTo: #DirectionEast.
	
	self moveMarsRoverFoward.
	self assertMarsRoverPositionIs: 1@0.
	
	self moveMarsRoverBackwards.
	self assertMarsRoverPositionIs: 0@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 5/30/2022 21:44:39'!
test07AMarsRoverCanRotateLeftAndMoveInThatDirectionWhenInstructedToDoSo

	self rotateMarsRoverLeft.
	self assertMarsRoverPointsTo: #DirectionWest.
	
	self moveMarsRoverFoward.
	self assertMarsRoverPositionIs: -1@0.
	
	self moveMarsRoverBackwards.
	self assertMarsRoverPositionIs: 0@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 5/30/2022 21:44:59'!
test08AMarsRoverCanRotateLeftAndRightMultipleTimes
	
	self rotateMarsRoverLeft.
	self assertMarsRoverPointsTo: #DirectionWest.
	
	self rotateMarsRoverLeft.
	self assertMarsRoverPointsTo: #DirectionSouth.
	
	self rotateMarsRoverRight.
	self assertMarsRoverPointsTo: #DirectionWest.
	
	self rotateMarsRoverRight.
	self assertMarsRoverPointsTo: #DirectionNorth.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 5/30/2022 21:43:07'!
test09AMarsRoverCanReceiveMultipleInstructionsAtTheSameTime
	
	marsRover followInstructions: 'fflb'.
	
	self assertMarsRoverPositionIs: 1@2! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 5/30/2022 21:45:32'!
test10AMarsRoverShouldRaiseAnErrorOnAInvalidInstruction
	
	self should: [marsRover followInstructions: 'x'.] 
		raise: Error 
		withMessageText: MarsRover invalidInstructionDescription.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LA 5/30/2022 21:45:47'!
test11AMarsRoverShouldCompleteAllInstructionsBeforeAnInvalidOne
	
	self should:[marsRover followInstructions: 'frbxb'.] 
		raise: Error 
		withMessageText: MarsRover invalidInstructionDescription.
	
	self assertMarsRoverPositionIs: -1@1! !


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

!MarsRover methodsFor: 'initialization' stamp: 'LA 5/30/2022 21:15:44'!
initialize

	position := 0@0.
	direction := DirectionNorth new.! !


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

!MarsRover class methodsFor: 'error messages' stamp: 'BB 5/28/2022 18:42:32'!
invalidInstructionDescription
	^'Invalid Instruction Received!!'! !
