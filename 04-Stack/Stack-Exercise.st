!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!OOStackTest methodsFor: 'test - extra' stamp: 'BB 5/14/2022 21:54:03'!
test11CanCreateAStackWithALimitedCapacity
	| stack |
	
	stack := OOStack withLimit: 3.
	
	self assert: stack isEmpty
! !

!OOStackTest methodsFor: 'test - extra' stamp: 'BB 5/14/2022 22:18:32'!
test12AssertThatPushAddsElementsWhenLimitIsHigher
	| stack |
	
	stack := OOStack withLimit: 3.
	
	stack push: 'something'.
	self assert: stack size equals: 1.

	stack push: 'another'.
	self assert: stack size equals: 2.! !

!OOStackTest methodsFor: 'test - extra' stamp: 'BB 5/14/2022 22:26:30'!
test13AssertThatPushFailsWhenLimitIsReached
	| stack |
	
	stack := OOStack withLimit: 1.
	
	self pushToTheLimit: stack. ! !

!OOStackTest methodsFor: 'test - extra' stamp: 'BB 5/14/2022 22:26:05'!
test14AssertThatLimitCanBeReachedAgain
	| stack |
	
	stack := OOStack withLimit: 1.
	
	self pushToTheLimit: stack.
	
	stack pop.
	
	self pushToTheLimit: stack.
	
	
	
	! !


!OOStackTest methodsFor: 'helpers' stamp: 'BB 5/14/2022 22:25:00'!
pushToTheLimit: aStack

	aStack push: 'something'.
	self assert: aStack size equals: 1.
	
	self should: [aStack push: 'another'] raise: Error assertingErrorMessageBeing: OOStack stackFullErrorDescription.! !


!OOStackTest methodsFor: 'assertions' stamp: 'BB 5/14/2022 22:06:02'!
should: aBlockThatShouldFail raise: anExceptionType assertingErrorMessageBeing: anErrorMessage

	[aBlockThatShouldFail value.
	self fail]
	on: anExceptionType 
	do: [ :anError | self assert: anErrorMessage equals: anError messageText ]! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack notEmptyStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'BB 5/14/2022 20:30:24'!
setUp
	
	emptyStack := OOStack new.
	
	notEmptyStack := OOStack new.
	notEmptyStack push: 'winter'.
	notEmptyStack push: 'window'.
	notEmptyStack push: 'sunny'.
	notEmptyStack push: ''.
	notEmptyStack push: 'Without'.
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BB 5/14/2022 18:54:24'!
test01CanCreateASentenceFinderByPrefixWithAStack
	
	| finder |
	
	finder := SentenceFinderByPrefix for: emptyStack.
	
	self assert: finder associatedStack equals: emptyStack.
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BB 5/14/2022 20:23:49'!
test02AssertThatFindFailsWhenEmptyPrefixIsGiven
	
	| finder |
	
	finder := SentenceFinderByPrefix for: notEmptyStack.
	
	self should: [finder find:''] raise: Error assertingErrorMessageBeing: Prefix canNotBeEmpty
	
	
	
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BB 5/14/2022 20:26:56'!
test03AssertThatFindFailsWhenPrefixIsNotAString

	| finder |
	
	finder := SentenceFinderByPrefix for: notEmptyStack.
	
	self should: [finder find:-4] raise: Error assertingErrorMessageBeing: Prefix hasToBeAString.
	
	
	
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BB 5/14/2022 20:27:08'!
test04AssertThatFindFailsWhenPrefixHasSpaces

	| finder |
	
	finder := SentenceFinderByPrefix for: notEmptyStack.
	
	self should: [finder find:'leo messi'] raise: Error assertingErrorMessageBeing: Prefix canNotIncludeSpaces
	
	
	
	
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BB 5/14/2022 18:56:02'!
test05AssertThatFindReturnsAnEmptyCollectionWhenNoMatches

	| finder matchedSentences emptyCollection |
	
	finder := SentenceFinderByPrefix for: notEmptyStack.
	
	matchedSentences := finder find: 'Boquita'.
	
	emptyCollection := OrderedCollection new.
	
	self assert: matchedSentences equals: emptyCollection
	
	
	
	
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BB 5/14/2022 18:56:25'!
test06AssertThatFindDoesNotModifyTheStack

	| finder |
	
	finder := SentenceFinderByPrefix for: notEmptyStack.
	
	finder find: 'Boquita'.
	
	self assert: finder associatedStack size equals: 5.
	self assert: finder associatedStack top equals: 'Without'.
	
	
	
	
	
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BB 5/14/2022 18:15:05'!
test07AssertThatFindReturnsACollectionWithOneElementWhenOnlyMatchIsFound

	| finder matchedSentences collectionWithSunny |
	
	finder := SentenceFinderByPrefix for: notEmptyStack.
	
	collectionWithSunny := OrderedCollection new.
	collectionWithSunny add: 'sunny'.
	
	matchedSentences := finder find: 'sunny'.
	
	self assert: matchedSentences equals: collectionWithSunny 
	
	
	
	
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BB 5/14/2022 18:30:05'!
test08AssertThatFindReturnsACollectionCaseSensitive

	| finder matchedSentences expectedCollection |
	
	finder := SentenceFinderByPrefix for: notEmptyStack.
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: 'winter'.
	expectedCollection add: 'window'.
	
	matchedSentences := finder find: 'wi'.
	
	self assert: matchedSentences equals: expectedCollection 
	
	
	
	
	
	
! !


!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'BB 5/14/2022 18:49:51'!
should: aBlockThatShouldFail raise: anExceptionType assertingErrorMessageBeing: anErrorMessage

	[aBlockThatShouldFail value.
	self fail]
	on: anExceptionType 
	do: [ :anError | self assert: anErrorMessage equals: anError messageText ]
	
	 ! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements state limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'state management' stamp: 'LA 5/12/2022 20:53:52'!
assertThatStackIsNotEmpty

	state onEmptyStateRaise: self class stackEmptyErrorDescription.
	
	! !

!OOStack methodsFor: 'state management' stamp: 'BB 5/14/2022 21:42:23'!
assertThatStackIsNotFull

	state onFullStateRaise: self class stackFullErrorDescription.
	
	! !

!OOStack methodsFor: 'state management' stamp: 'LA 5/12/2022 20:47:57'!
revalidateState

	state := State with: self.! !


!OOStack methodsFor: 'basic operations' stamp: 'BB 5/14/2022 21:59:58'!
initialize
	
	elements := OrderedCollection new.
	state := Empty  new.
	limit := -1.
	! !

!OOStack methodsFor: 'basic operations' stamp: 'BB 5/14/2022 21:36:37'!
initializeWithLimit: maximumNumberOfElements
	
	elements := OrderedCollection new.
	state := Empty  new.
	limit := maximumNumberOfElements ! !

!OOStack methodsFor: 'basic operations' stamp: 'LA 5/12/2022 19:45:18'!
isEmpty

	^elements isEmpty.! !

!OOStack methodsFor: 'basic operations' stamp: 'BB 5/14/2022 22:01:34'!
isFull

	^(self size >= limit) and: (limit positive).! !

!OOStack methodsFor: 'basic operations' stamp: 'BB 5/14/2022 19:02:27'!
pop

	| removedElement |
	
	self assertThatStackIsNotEmpty.
	
	removedElement := elements removeLast.
	
	self revalidateState.
	
	^removedElement.! !

!OOStack methodsFor: 'basic operations' stamp: 'BB 5/14/2022 21:41:44'!
push: aString 

	self assertThatStackIsNotFull.
	elements addLast: aString.
	self revalidateState.! !

!OOStack methodsFor: 'basic operations' stamp: 'LA 5/12/2022 19:45:32'!
size

	^elements size.! !

!OOStack methodsFor: 'basic operations' stamp: 'BB 5/14/2022 19:03:15'!
top

	self assertThatStackIsNotEmpty.
	^elements last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'BB 5/14/2022 21:42:57'!
stackFullErrorDescription

	^'Stack is Full!!'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'BB 5/14/2022 21:53:20'!
withLimit: maximumNumberOfElements
	
		^self new initializeWithLimit: maximumNumberOfElements ! !


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Prefix methodsFor: 'initialization' stamp: 'BB 5/14/2022 19:43:07'!
initializeWith: aPrefix

	value := aPrefix.! !


!Prefix methodsFor: 'basic operations' stamp: 'BB 5/14/2022 19:19:04'!
validate

	self subclassResponsibility.! !

!Prefix methodsFor: 'basic operations' stamp: 'BB 5/14/2022 19:41:48'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 19:49:34'!
creationWith: aPrefix

	self subclassResponsibility.! !

!Prefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:07:06'!
fitsTo: aPrefix

	self subclassResponsibility.! !

!Prefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:21:21'!
with: aPrefix
	
	| subclass |
	subclass  :=  Prefix subclasses detect: [:aSubclass | aSubclass fitsTo: aPrefix ]
		ifNone: [^ValidPrefix creationWith: aPrefix ].
		
		^subclass creationWith: aPrefix.
	
	! !


!Prefix class methodsFor: 'error messages' stamp: 'BB 5/14/2022 19:21:34'!
canNotBeEmpty
	^'prefix can not be empty!!'! !

!Prefix class methodsFor: 'error messages' stamp: 'BB 5/14/2022 19:22:09'!
canNotIncludeSpaces
	^'prefix can not include spaces!!'! !

!Prefix class methodsFor: 'error messages' stamp: 'BB 5/14/2022 19:22:23'!
hasToBeAString
	^'prefix has to be a string!!'! !


!classDefinition: #EmptyPrefix category: 'Stack-Exercise'!
Prefix subclass: #EmptyPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyPrefix methodsFor: 'basic operations' stamp: 'BB 5/14/2022 20:26:16'!
validate
	self error: Prefix canNotBeEmpty! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyPrefix class' category: 'Stack-Exercise'!
EmptyPrefix class
	instanceVariableNames: ''!

!EmptyPrefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:56:05'!
creationWith: aPrefix

	^self new initializeWith: aPrefix! !

!EmptyPrefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:09:23'!
fitsTo: aPrefix

	^aPrefix = ''.! !


!classDefinition: #NonStringPrefix category: 'Stack-Exercise'!
Prefix subclass: #NonStringPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonStringPrefix methodsFor: 'basic operations' stamp: 'BB 5/14/2022 20:26:25'!
validate
	self error: Prefix hasToBeAString! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonStringPrefix class' category: 'Stack-Exercise'!
NonStringPrefix class
	instanceVariableNames: ''!

!NonStringPrefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:56:50'!
creationWith: aPrefix

	^self new initializeWith: aPrefix! !

!NonStringPrefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:19:08'!
fitsTo: aPrefix

	^(aPrefix isKindOf: String) not.! !


!classDefinition: #SpacedPrefix category: 'Stack-Exercise'!
Prefix subclass: #SpacedPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SpacedPrefix methodsFor: 'basic operations' stamp: 'BB 5/14/2022 20:26:32'!
validate
	self error: Prefix canNotIncludeSpaces! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SpacedPrefix class' category: 'Stack-Exercise'!
SpacedPrefix class
	instanceVariableNames: ''!

!SpacedPrefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:56:57'!
creationWith: aPrefix

	^self new initializeWith: aPrefix! !

!SpacedPrefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:13:47'!
fitsTo: aPrefix

	^('* *') match: aPrefix ! !


!classDefinition: #ValidPrefix category: 'Stack-Exercise'!
Prefix subclass: #ValidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValidPrefix methodsFor: 'basic operations' stamp: 'BB 5/14/2022 19:33:38'!
validate 
	
	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidPrefix class' category: 'Stack-Exercise'!
ValidPrefix class
	instanceVariableNames: ''!

!ValidPrefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 19:49:35'!
creationWith: aPrefix

	^self new initializeWith: aPrefix.! !

!ValidPrefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:16:49'!
fitsTo: aPrefix
	"returns false so it acts as a default when any other Prefix subclass fits"

	^false! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'BB 5/14/2022 16:12:43'!
initializeWith: aStack

	stack := aStack.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'BB 5/14/2022 20:53:22'!
ifThePopOf: aStack MatchesWith: aPrefix addItTo: aCollection

	| sentence |
	sentence := aStack pop.
	
	 (sentence beginsWith: aPrefix value) ifTrue: [
		aCollection add: sentence
	]


! !


!SentenceFinderByPrefix methodsFor: 'basic operations' stamp: 'BB 5/14/2022 16:16:33'!
associatedStack

	^stack.! !

!SentenceFinderByPrefix methodsFor: 'basic operations' stamp: 'BB 5/14/2022 20:53:22'!
find: prefixToEvaluate

	| matchedSentences cloneOfStack prefix |
	
	prefix := Prefix with: prefixToEvaluate.
	
	prefix validate.
 
	matchedSentences := OrderedCollection new.
	
	cloneOfStack := stack veryDeepCopy .
	cloneOfStack size timesRepeat: [self ifThePopOf: cloneOfStack MatchesWith: prefix addItTo: matchedSentences].
	
	^matchedSentences reversed.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 16:33:56'!
for: aStack

	^self new initializeWith: aStack.! !


!classDefinition: #State category: 'Stack-Exercise'!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!State methodsFor: 'basic operations' stamp: 'LA 5/12/2022 20:18:09'!
onEmptyStateRaise: anError

	^self subclassResponsibility.! !

!State methodsFor: 'basic operations' stamp: 'BB 5/14/2022 21:43:42'!
onFullStateRaise: anError

	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'State class' category: 'Stack-Exercise'!
State class
	instanceVariableNames: ''!

!State class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:07:07'!
fitsTo: anOOStack

	^self subclassResponsibility .! !

!State class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:07:07'!
with: anOOStack
	
	| subclass |
	
	subclass := State subclasses detect: [:aSubclass | aSubclass fitsTo: anOOStack ].
	
	^subclass new.! !


!classDefinition: #Empty category: 'Stack-Exercise'!
State subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Empty methodsFor: 'basic operations' stamp: 'LA 5/12/2022 20:18:09'!
onEmptyStateRaise: anError
	
	^self error: anError.! !

!Empty methodsFor: 'basic operations' stamp: 'BB 5/14/2022 21:44:38'!
onFullStateRaise: anError
	
	^'No error'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: 'Stack-Exercise'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 20:07:07'!
fitsTo: anOOStack

	^anOOStack isEmpty.! !


!classDefinition: #Full category: 'Stack-Exercise'!
State subclass: #Full
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Full methodsFor: 'basic operations' stamp: 'BB 5/14/2022 21:40:03'!
onEmptyStateRaise: anError
	
	^'No error'.! !

!Full methodsFor: 'basic operations' stamp: 'BB 5/14/2022 21:45:21'!
onFullStateRaise: anError
	
	^self error: anError.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Full class' category: 'Stack-Exercise'!
Full class
	instanceVariableNames: ''!

!Full class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 21:40:49'!
fitsTo: anOOStack

	^anOOStack isFull.! !


!classDefinition: #NotEmpty category: 'Stack-Exercise'!
State subclass: #NotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmpty methodsFor: 'basic operations' stamp: 'LA 5/12/2022 21:09:13'!
onEmptyStateRaise: anError
	
	^'No error'.! !

!NotEmpty methodsFor: 'basic operations' stamp: 'BB 5/14/2022 21:44:19'!
onFullStateRaise: anError
	
	^'No error'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmpty class' category: 'Stack-Exercise'!
NotEmpty class
	instanceVariableNames: ''!

!NotEmpty class methodsFor: 'instance creation' stamp: 'BB 5/14/2022 21:46:23'!
fitsTo: anOOStack

	^(anOOStack isEmpty not and: anOOStack isFull not)! !
