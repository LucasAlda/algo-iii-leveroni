!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BB 5/28/2022 17:11:12'!
test01AMarsRoverStartsAtOriginCoordinatesPointingNorth
	|marsRover|
	marsRover := MarsRover new.
	
	self assert: marsRover position equals: 0@0.
	self assert: marsRover direction equals: #North.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BB 5/28/2022 16:49:06'!
test02AMarsRoverDoesNothingWhenItReceivesEmptyInstructions
	|marsRover|
	marsRover := MarsRover new.
	marsRover followInstructions: ''.
	
	self assert: marsRover position equals: 0@0! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BB 5/28/2022 16:48:17'!
test03AMarsRoverCanMoveFowardWhenInstructedToDoSo
	|marsRover|
	marsRover := MarsRover new.
	marsRover followInstructions: 'f'.
	
	self assert: marsRover position equals: 0@1! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BB 5/28/2022 16:48:03'!
test04AMarsRoverCanMoveBackwardsWhenInstructedToDoSo
	|marsRover|
	marsRover := MarsRover new.
	marsRover followInstructions: 'b'.
	
	self assert: marsRover position equals: 0@-1! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BB 5/28/2022 16:47:10'!
test05AMarsRoverCanMoveFowardAndBackwardsMultipleTimes
	|marsRover|
	marsRover := MarsRover new.
	
	marsRover followInstructions: 'f'.
	self assert: marsRover position equals: 0@1.
	
	marsRover followInstructions: 'f'.
	self assert: marsRover position equals: 0@2.
	
	marsRover followInstructions: 'b'.
	self assert: marsRover position equals: 0@1.
	
	marsRover followInstructions: 'b'.
	self assert: marsRover position equals: 0@0.
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BB 5/28/2022 17:38:12'!
test06AMarsRoverCanRotateRightAndMoveInThatDirectionWhenInstructedToDoSo
	|marsRover|
	marsRover := MarsRover new.
	
	marsRover followInstructions: 'r'.
	self assert: marsRover direction equals: #East.
	
	marsRover followInstructions: 'f'.
	self assert: marsRover position equals: 1@0.
	
	marsRover followInstructions: 'b'.
	self assert: marsRover position equals: 0@0.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BB 5/28/2022 17:38:04'!
test07AMarsRoverCanRotateLeftAndMoveInThatDirectionWhenInstructedToDoSo
	|marsRover|
	marsRover := MarsRover new.
	
	marsRover followInstructions: 'l'.
	self assert: marsRover direction equals: #West.
	
	marsRover followInstructions: 'f'.
	self assert: marsRover position equals: -1@0.
	
	marsRover followInstructions: 'b'.
	self assert: marsRover position equals: 0@0.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BB 5/28/2022 17:39:31'!
test08AMarsRoverCanRotateLeftAndRightMultipleTimes
	|marsRover|
	marsRover := MarsRover new.
	
	marsRover followInstructions: 'l'.
	self assert: marsRover direction equals: #West.
	
	marsRover followInstructions: 'l'.
	self assert: marsRover direction equals: #South.
	
	marsRover followInstructions: 'r'.
	self assert: marsRover direction equals: #West.
	
	marsRover followInstructions: 'r'.
	self assert: marsRover direction equals: #North.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BB 5/28/2022 18:00:56'!
test09AMarsRoverCanReceiveMultipleInstructionsAtTheSameTime
	|marsRover|
	marsRover := MarsRover new.
	
	marsRover followInstructions: 'fflb'.
	
	self assert: marsRover position equals: 1@2! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BB 5/28/2022 19:45:32'!
test10AMarsRoverShouldRaiseAnErrorOnAInvalidInstruction
	|marsRover|
	marsRover := MarsRover new.
	
	self should:[marsRover followInstructions: 'x'.] raise: Error withMessageText: MarsRover invalidInstructionDescription.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'BB 5/28/2022 19:48:13'!
test11AMarsRoverShouldCompleteAllInstructionsBeforeAnInvalidOne
	|marsRover|
	marsRover := MarsRover new.
	
	self should:[marsRover followInstructions: 'frbxb'.] raise: Error withMessageText: MarsRover invalidInstructionDescription.
	
	self assert: marsRover position equals: -1@1! !


!classDefinition: #CardinalPoint category: 'MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!CardinalPoint methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:18:55'!
name

	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:39:27'!
rotatedLeft
	
	self subclassResponsibility! !

!CardinalPoint methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:39:31'!
rotatedRight 
	
	self subclassResponsibility! !

!CardinalPoint methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:18:58'!
versor

	self subclassResponsibility.! !


!classDefinition: #East category: 'MarsRover'!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:17:39'!
name

	^#East! !

!East methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:09:35'!
rotatedLeft

	^North new! !

!East methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:10:16'!
rotatedRight

	^South new! !

!East methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:09:35'!
versor

	^1@0! !


!classDefinition: #North category: 'MarsRover'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:18:23'!
name

	^#North! !

!North methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:09:35'!
rotatedLeft

	^West new! !

!North methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:10:16'!
rotatedRight

	^East new! !

!North methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:09:28'!
versor

	^0@1! !


!classDefinition: #South category: 'MarsRover'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:18:35'!
name

	^#South! !

!South methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:09:35'!
rotatedLeft

	^East new! !

!South methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:10:16'!
rotatedRight

	^West new! !

!South methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:09:55'!
versor

	^0@-1! !


!classDefinition: #West category: 'MarsRover'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:18:44'!
name

	^#West! !

!West methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:09:35'!
rotatedLeft

	^South new! !

!West methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:10:16'!
rotatedRight

	^North new! !

!West methodsFor: 'basic operations' stamp: 'BB 5/28/2022 17:10:01'!
versor

	^-1@0! !


!classDefinition: #Instruction category: 'MarsRover'!
Object subclass: #Instruction
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Instruction methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:03:08'!
executeInstructionOn: aMarsRover

	self subclassResponsibility.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Instruction class' category: 'MarsRover'!
Instruction class
	instanceVariableNames: ''!

!Instruction class methodsFor: 'instance creation - private' stamp: 'BB 5/28/2022 19:28:33'!
isTriggeredBy: aCommand
	
	self subclassResponsibility. 
	
	! !


!Instruction class methodsFor: 'instance creation' stamp: 'BB 5/28/2022 19:29:58'!
with: aCommand
	
	|correctInstruction|
	
	correctInstruction := self subclasses detect: [ :aSubclass | aSubclass isTriggeredBy: aCommand ] ifNone: [ self error: MarsRover invalidInstructionDescription ].
	
	^correctInstruction new.
	
	! !


!classDefinition: #InstructionBackwards category: 'MarsRover'!
Instruction subclass: #InstructionBackwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!InstructionBackwards methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:05:25'!
executeInstructionOn: aMarsRover
	
	aMarsRover moveBackwards.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InstructionBackwards class' category: 'MarsRover'!
InstructionBackwards class
	instanceVariableNames: ''!

!InstructionBackwards class methodsFor: 'instance creation - private' stamp: 'BB 5/28/2022 19:30:58'!
isTriggeredBy: aCommand

	^aCommand = $b.! !


!classDefinition: #InstructionFoward category: 'MarsRover'!
Instruction subclass: #InstructionFoward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!InstructionFoward methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:07:27'!
executeInstructionOn: aMarsRover

	aMarsRover moveFoward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InstructionFoward class' category: 'MarsRover'!
InstructionFoward class
	instanceVariableNames: ''!

!InstructionFoward class methodsFor: 'instance creation - private' stamp: 'BB 5/28/2022 19:30:44'!
isTriggeredBy: aCommand

	^aCommand = $f.! !


!classDefinition: #InstructionRotateLeft category: 'MarsRover'!
Instruction subclass: #InstructionRotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!InstructionRotateLeft methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:09:52'!
executeInstructionOn: aMarsRover

	aMarsRover rotateLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InstructionRotateLeft class' category: 'MarsRover'!
InstructionRotateLeft class
	instanceVariableNames: ''!

!InstructionRotateLeft class methodsFor: 'instance creation - private' stamp: 'BB 5/28/2022 19:31:09'!
isTriggeredBy: aCommand

	^aCommand = $l.! !


!classDefinition: #InstructionRotateRight category: 'MarsRover'!
Instruction subclass: #InstructionRotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!InstructionRotateRight methodsFor: 'basic operations' stamp: 'BB 5/28/2022 19:10:26'!
executeInstructionOn: aMarsRover

	aMarsRover rotateRight! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InstructionRotateRight class' category: 'MarsRover'!
InstructionRotateRight class
	instanceVariableNames: ''!

!InstructionRotateRight class methodsFor: 'instance creation - private' stamp: 'BB 5/28/2022 19:31:19'!
isTriggeredBy: aCommand

	^aCommand = $r.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'BB 5/28/2022 17:10:24'!
initialize

	position := 0@0.
	direction := North new.! !


!MarsRover methodsFor: 'private - instructions' stamp: 'BB 5/28/2022 19:33:45'!
moveBackwards
	
	^self move: direction versor negated! !

!MarsRover methodsFor: 'private - instructions' stamp: 'BB 5/28/2022 19:33:55'!
moveFoward

	^self move: direction versor! !

!MarsRover methodsFor: 'private - instructions' stamp: 'BB 5/28/2022 19:12:39'!
rotateLeft
	
	^direction:= direction rotatedLeft! !

!MarsRover methodsFor: 'private - instructions' stamp: 'BB 5/28/2022 19:12:11'!
rotateRight
	
	^direction:= direction rotatedRight! !


!MarsRover methodsFor: 'private' stamp: 'BB 5/28/2022 19:31:56'!
followInstruction: anInstructionCommand 
	
	| anInstruction |
	anInstruction := Instruction with: anInstructionCommand.
	
	anInstruction executeInstructionOn: self.
	! !

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
