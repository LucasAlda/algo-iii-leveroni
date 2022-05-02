!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'BB 5/1/2022 17:57:35'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self running: [customerBook addCustomerNamed: 'John Lennon'.]
		shouldNotTakeLongerThan: (50 * millisecond).
	
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BB 5/1/2022 19:14:23'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := self createCustomerBookWithPaulMcCartney.
	
	self running: [customerBook removeCustomerNamed: 'Paul McCartney'.]
		shouldNotTakeLongerThan: (100 * millisecond).

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BB 5/1/2022 19:11:58'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: (self onErrorAddingACustomerWithEmptyNameIsNotPossible: customerBook )! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BB 5/1/2022 18:18:27'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook  |
			
	customerBook := self createCustomerBookWithJohnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: (self onErrorCustomerBookShouldOnlyIncludeJohnLennon: customerBook).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BB 5/1/2022 19:16:42'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := self createCustomerBookWithPaulMcCartney.
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	
	self assertThatNumberOfCustomersOf: customerBook active: 0 suspended: 1 total: 1.
	self assert: (self paulMcCartneyIsIncludedIn: customerBook).

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BB 5/1/2022 19:01:21'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithPaulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertThatNumberOfCustomersOf: customerBook active: 0 suspended: 0 total: 0.
	self deny: (self paulMcCartneyIsIncludedIn: customerBook).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BB 5/1/2022 18:19:16'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook  |
			
	customerBook := self createCustomerBookWithJohnLennon.
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: (self onErrorCustomerBookShouldOnlyIncludeJohnLennon: customerBook).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BB 5/1/2022 18:19:08'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook  johnLennon|
	
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWithJohnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: (self onErrorCustomerBookShouldOnlyIncludeJohnLennon: customerBook).
! !


!CustomerBookTest methodsFor: 'private' stamp: 'BB 5/1/2022 18:48:43'!
assertThatNumberOfCustomersOf: aCustomerBook 
	active: activeCustomers
	suspended: suspendedCustomers 
	total: totalCustomers
	
	self assert: activeCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: totalCustomers equals: aCustomerBook numberOfCustomers.
	! !

!CustomerBookTest methodsFor: 'private' stamp: 'BB 5/1/2022 18:20:58'!
createCustomerBookWith: aName

	| customerBook |
			
		customerBook := CustomerBook new.
		customerBook addCustomerNamed: aName.
		
		^customerBook.
	! !

!CustomerBookTest methodsFor: 'private' stamp: 'BB 5/1/2022 18:21:59'!
createCustomerBookWithJohnLennon
		
		^self createCustomerBookWith: 'John Lennon'.
	! !

!CustomerBookTest methodsFor: 'private' stamp: 'BB 5/1/2022 18:23:36'!
createCustomerBookWithPaulMcCartney
		
		^self createCustomerBookWith: 'Paul McCartney'.
	! !

!CustomerBookTest methodsFor: 'private' stamp: 'BB 5/1/2022 19:11:32'!
onErrorAddingACustomerWithEmptyNameIsNotPossible: aCustomerBook
	
	^[ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: aCustomerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'private' stamp: 'BB 5/1/2022 18:17:07'!
onErrorCustomerBookShouldOnlyIncludeJohnLennon: customerBook

	^[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon')].! !

!CustomerBookTest methodsFor: 'private' stamp: 'BB 5/1/2022 18:57:54'!
paulMcCartneyIsIncludedIn: aCustomerBook

	^(aCustomerBook includesCustomerNamed: 'Paul McCartney').! !

!CustomerBookTest methodsFor: 'private' stamp: 'BB 5/1/2022 17:58:15'!
running: aBlock shouldNotTakeLongerThan: time
	 
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < time.
	
	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'BB 5/1/2022 17:42:44'!
includesCustomerNamed: aName

	[self findWhereACustomerIsbyName: aName]
		on: NotFound
		do: [^false].
	
	^true.! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'BB 5/1/2022 17:41:25'!
addCustomerNamed: aName
	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue:  [ self signalCustomerAlreadyExists ].
	
	active add: aName
	
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'BB 5/1/2022 17:09:16'!
numberOfCustomers
	
	^(self numberOfActiveCustomers + self numberOfSuspendedCustomers).! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'BB 5/1/2022 17:33:24'!
removeCustomerNamed: aName 
 	| customerCollection |
	
	customerCollection := self findWhereACustomerIsbyName: aName.
	self removeIfPossibleFrom: customerCollection customerNamed: aName.

	
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'BB 5/1/2022 17:34:31'!
suspendCustomerNamed: aName 
	
	(self removeIfPossibleFrom: active customerNamed: aName) ifFalse:  [^CantSuspend signal].
	suspended add: aName.
! !


!CustomerBook methodsFor: 'private' stamp: 'BB 5/1/2022 17:03:31'!
findWhereACustomerIsbyName: aName
	
	(active includes: aName) ifTrue: [^active].
	(suspended includes: aName) ifTrue: [^suspended].
	
	^NotFound signal.
	

	! !

!CustomerBook methodsFor: 'private' stamp: 'BB 5/1/2022 17:32:47'!
removeIfPossibleFrom: aCollection customerNamed: aName
	
	aCollection remove: aName ifAbsent: [^false].
	^true.
	


! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
