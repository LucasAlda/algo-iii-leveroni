!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:42:05'!
test16EmptyPortfolioDoNotHasEntitiesAndBalanceZero
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 * peso equals: portfolio balance.
	self assert: 0 equals: portfolio finantialEntities size.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:42:00'!
test17PortfolioCanAddAnAccountAndHisBalanceEqualsAccountBalance
	
	| portfolio anAccount |
	
	portfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	
	self deposit: 100 * peso on: anAccount.
	
	portfolio add: anAccount.
	
	self assert: 1 equals: portfolio finantialEntities size.
	self assert: anAccount balance equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:41:55'!
test18PortfolioCanHaveMultipleAccountsAndSumBalances
	
	| portfolio anAccount anotherAccount |
	
	portfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	self deposit: 100 * peso on: anAccount.
	self deposit: 200 * peso on: anotherAccount.
	
	portfolio add: anAccount.
	portfolio add: anotherAccount. 
	
	self assert: 2 equals: portfolio finantialEntities size.
	self assert: 300 * peso equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:40:29'!
test19PortfolioKnowsIfAnyAccountRegisteredATransaction
	
	| portfolio anAccount deposit |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.

	portfolio add: anAccount.
	deposit := self deposit: 100 * peso on: anAccount.
		
	self assert: (portfolio hasRegistered: deposit).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:40:24'!
test20PortfolioCanGetAllAccountsTransactions
	
	| portfolio anAccount anotherAccount |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.

	portfolio add: anAccount.
	portfolio add: anotherAccount.	
	
	self deposit: 100 * peso on: anAccount.
	self deposit: 200 * peso on: anotherAccount.		
	
	self assert: 3 equals: portfolio transactions size.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:36:51'!
testXXPortfolioCanHaveMultiplePortfoliosAndAccounts
	
	| portfolio anotherPortfolio anAccount anotherAccount |
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.	
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	self deposit: 100 * peso on: anAccount.
	self deposit: 200 * peso on: anotherAccount.

	portfolio add: anAccount.
	anotherPortfolio add: anotherAccount. 
	
	portfolio add: anotherPortfolio.
	
	self assert: 2 equals: portfolio finantialEntities size.
	self assert: 300 * peso equals: portfolio balance.
	! !


!PortfolioTest methodsFor: 'private' stamp: 'LA 6/6/2022 21:27:25'!
deposit: anAmount on: anAccount
	
	^Deposit register: anAmount on: anAccount ! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:27:59'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	
	self assertBalanceOfAccountIs: 0 * peso
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:31:45'!
test02DepositIncreasesBalanceOnTransactionValue 

	self depositOnAccount: 100 * peso.
		
	self assertBalanceOfAccountIs: 100 * peso. 
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:30:57'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	self depositOnAccount: 100 * peso.
	self withdrawOnAccount: 50 * peso.
		
	self assertBalanceOfAccountIs: 50 * peso

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/6/2022 20:09:16'!
test04WithdrawValueMustBePositive 

	| withdrawValue |
	
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:31:13'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	deposit := self depositOnAccount: 100 * peso.
	withdraw := self withdrawOnAccount: 50 * peso.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/5/2022 17:33:59'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:31:55'!
test07AccountKnowsItsTransactions 

	| deposit |
	
	
	deposit := self depositOnAccount: 50 * peso.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:40:02'!
test08NeitherDepositsNorWithdrawsCanHaveZeroAmount

	self should: [self depositOnAccount: 0 * peso]
		raise: Error
		withMessageText: 'Transactions amount can not be zero!!'.

	self should: [self withdrawOnAccount: 0 * peso]
		raise: Error
		withMessageText: 'Transactions amount can not be zero!!'.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:39:56'!
test09NeitherDepositsNorWithdrawsCanHaveNegativeAmount

	self should: [self depositOnAccount: -10 * peso]
		raise: Error
		withMessageText: 'Transactions amount can not be for negative!!'.

	self should: [self withdrawOnAccount: -10 * peso]
		raise: Error
		withMessageText: 'Transactions amount can not be for negative!!'.! !


!ReceptiveAccountTest methodsFor: 'private' stamp: 'LA 6/7/2022 15:29:46'!
depositOnAccount: anAmount
	
	^Deposit register: anAmount on: account.! !

!ReceptiveAccountTest methodsFor: 'private' stamp: 'LA 6/7/2022 15:30:23'!
withdrawOnAccount: anAmount
	
	^Withdraw register: anAmount on: account.! !


!ReceptiveAccountTest methodsFor: 'assertions' stamp: 'LA 6/7/2022 15:27:45'!
assertBalanceOfAccountIs: anAmount
	
	self assert: account balance equals: anAmount ! !


!ReceptiveAccountTest methodsFor: 'setup' stamp: 'LA 6/7/2022 15:31:36'!
setUp
	
	account := ReceptiveAccount new.	
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: 'senderAccount receiverAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'private' stamp: 'LA 6/7/2022 15:15:51'!
transfer: anAmount

	^Transference from: senderAccount to: receiverAccount amount: anAmount.! !


!TransferenceTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:35:50'!
test10CanCreateATransferenceBetweenTwoAccounts

	| transference |
	
	transference := self transfer: 75 * peso.
	
	self assert: 75 * peso equals: transference value.! !

!TransferenceTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:36:31'!
test11TransferenceDecreaseAndIncreaseBalanceOnTransferenceParts
	
	self transfer: 75 * peso.
		
	self assertBalanceOf: senderAccount is: 25 * peso.
	self assertBalanceOf: receiverAccount is: 75 * peso.! !

!TransferenceTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:36:23'!
test12BothPartsRegisteredTheirTransferenceLeg

	| transference |
	
	transference := self transfer: 75 * peso.
		
	self assert: (senderAccount hasRegistered: transference withdrawLeg).
	self assert: (receiverAccount hasRegistered: transference depositLeg).! !

!TransferenceTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:36:09'!
test13BothTransferenceLegsKnowTheirCounterpart

	| transference depositLeg withdrawLeg |
		
	transference := self transfer: 75 * peso.
	
	withdrawLeg := transference withdrawLeg.
	depositLeg := transference depositLeg.		
	
	self assertCounterpartOf: withdrawLeg is: depositLeg.
	self assertCounterpartOf: depositLeg is: withdrawLeg.
! !

!TransferenceTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:38:59'!
test14TransferencesCannotHaveZeroAmount

	self should: [self transfer: 0 * peso]
		raise: Error
		withMessageText: 'Transactions amount can not be zero!!'.
			! !

!TransferenceTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:38:44'!
test15TransferencesCannotHaveNegativeAmount

	self should: [self transfer: -10 * peso]
		raise: Error
		withMessageText: 'Transactions amount can not be negative!!'.
			! !


!TransferenceTest methodsFor: 'setUp' stamp: 'LA 6/7/2022 15:20:53'!
setUp

	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: senderAccount 
	! !


!TransferenceTest methodsFor: 'assertions' stamp: 'LA 6/7/2022 15:21:41'!
assertBalanceOf: anAccount is: anAmount
	
	self assert: anAccount balance equals: anAmount ! !

!TransferenceTest methodsFor: 'assertions' stamp: 'LA 6/7/2022 15:23:30'!
assertCounterpartOf: aTransferenceLeg is: anotherTransferenceLeg
	
	self assert: aTransferenceLeg counterpart equals: anotherTransferenceLeg ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'accessing' stamp: 'LA 6/5/2022 16:34:00'!
transactionValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:54:08'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:54:51'!
transactionValue

	^ self value! !

!Deposit methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:54:26'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #DepositTransference category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #DepositTransference
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositTransference methodsFor: 'initialization' stamp: 'LA 6/6/2022 20:37:46'!
initializeAsLegOf: aTransference

	transference := aTransference. ! !



!DepositTransference methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:46:45'!
counterpart

	^transference counterpartOf: self.! !

!DepositTransference methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:43:17'!
transactionValue

	^ self value! !

!DepositTransference methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:40:28'!
value

	^transference value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositTransference class' category: 'ServiciosFinancieros-Ejercicio'!
DepositTransference class
	instanceVariableNames: ''!

!DepositTransference class methodsFor: 'as yet unclassified' stamp: 'LA 6/5/2022 16:44:46'!
for: aValue
	
	^self new initializeFor: aValue.! !

!DepositTransference class methodsFor: 'as yet unclassified' stamp: 'LA 6/6/2022 20:44:33'!
registerAsLegOf: aTransference on: anAccount 

	| depositTransference |
	
	depositTransference := self new initializeAsLegOf: aTransference.
	anAccount register: depositTransference.
		
	^ depositTransference
	! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:55:17'!
transactionValue

	^self value negated! !

!Withdraw methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:55:22'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #WithdrawTransference category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #WithdrawTransference
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawTransference methodsFor: 'initialization' stamp: 'LA 6/6/2022 20:39:00'!
initializeAsLegOf: aTransference

	transference := aTransference. ! !



!WithdrawTransference methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:47:25'!
counterpart

	^transference counterpartOf: self.! !

!WithdrawTransference methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:42:52'!
transactionValue

	^self value negated! !

!WithdrawTransference methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:42:05'!
value

	^transference value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawTransference class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawTransference class
	instanceVariableNames: ''!

!WithdrawTransference class methodsFor: 'as yet unclassified' stamp: 'LA 6/5/2022 16:45:12'!
for: aValue
	
	^self new initializeFor: aValue.! !

!WithdrawTransference class methodsFor: 'as yet unclassified' stamp: 'LA 6/6/2022 20:44:43'!
registerAsLegOf: aTransference on: anAccount 

	| withdrawTransference |
	
	withdrawTransference := self new initializeAsLegOf: aTransference.
	anAccount register: withdrawTransference.
		
	^ withdrawTransference! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'finantialEntities'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'LA 6/7/2022 13:22:14'!
add: aFinantialEntity 

	finantialEntities addLast: aFinantialEntity ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'LA 6/7/2022 13:17:47'!
balance

	^self finantialEntities sum: [:account | account balance] ifEmpty: 0.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'LA 6/7/2022 13:17:47'!
finantialEntities

	^finantialEntities copy! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'LA 6/7/2022 14:39:15'!
hasRegistered: aTransaction

	finantialEntities detect: [ :entity | entity hasRegistered: aTransaction ] 
		ifFound: [ :entity | ^true ] 
		ifNone: [ ^false ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'LA 6/7/2022 13:17:25'!
initialize

	finantialEntities := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LA 6/5/2022 16:35:17'!
balance

	^transactions sum: [ :aTransaction | aTransaction transactionValue ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'LA 6/6/2022 20:53:01'!
initializeFrom: aSenderAccount to: aReceiverAccount amount: anAmountToTransfer 

	value := anAmountToTransfer.
	depositLeg := DepositTransference registerAsLegOf: self on: aReceiverAccount .
	withdrawLeg := WithdrawTransference registerAsLegOf: self on: aSenderAccount .! !


!Transference methodsFor: 'accessing' stamp: 'LA 6/5/2022 17:02:28'!
value
	
	^value.! !


!Transference methodsFor: 'private' stamp: 'LA 6/7/2022 14:29:40'!
counterpartOf: aTranferenceLeg

	(aTranferenceLeg = depositLeg) 
		ifTrue: [^withdrawLeg]
		ifFalse: [^depositLeg].
! !


!Transference methodsFor: 'testing' stamp: 'LA 6/5/2022 17:26:36'!
depositLeg
	
	^depositLeg.! !

!Transference methodsFor: 'testing' stamp: 'LA 6/5/2022 17:26:45'!
withdrawLeg
	
	^withdrawLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'LA 6/5/2022 17:00:36'!
from: anAccountToGive to: anAccountToReceive amount: anAmountToTransfer 
	
	^self new initializeFrom: anAccountToGive to: anAccountToReceive amount: anAmountToTransfer ! !