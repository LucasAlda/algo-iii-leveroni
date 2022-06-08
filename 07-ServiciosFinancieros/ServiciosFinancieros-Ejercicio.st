!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'BB 6/7/2022 20:39:45'!
test16EmptyPortfolioDoesNotHaveAccountsAndBalanceIsZero
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 * peso equals: portfolio balance.

	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BB 6/7/2022 20:39:19'!
test17PortfolioCanAddAReceptiveAccountAndTheirBalancesAreTheSame
	
	| portfolio aReceptiveAccount |
	
	portfolio := Portfolio new.
	
	aReceptiveAccount := ReceptiveAccount new.
	
	self deposit: 100 * peso on: aReceptiveAccount.
	
	portfolio add: aReceptiveAccount.
	
	self assert: aReceptiveAccount balance equals: portfolio balance.
	
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BB 6/7/2022 20:39:06'!
test18PortfolioCanHaveMultipleReceptiveAccountsAndSumBalances
	
	| portfolio aReceptiveAccount anotherReceptiveAccount |
	
	portfolio := Portfolio new.
	
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	
	self deposit: 100 * peso on: aReceptiveAccount.
	self deposit: 200 * peso on: anotherReceptiveAccount.
	
	portfolio add: aReceptiveAccount.
	portfolio add: anotherReceptiveAccount. 
	
	self assert: 300 * peso equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BB 6/7/2022 19:54:52'!
test19PortfolioKnowsIfAReceptiveAccountRegisteredATransaction
	
	| portfolio aReceptiveAccount deposit |
	
	portfolio := Portfolio new.
	aReceptiveAccount := ReceptiveAccount new.

	portfolio add: aReceptiveAccount.
	deposit := self deposit: 100 * peso on: aReceptiveAccount.
		
	self assert: (portfolio hasRegistered: deposit).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BB 6/7/2022 19:57:24'!
test20PortfolioCanGetAllReceptiveAccountsTransactions
	
	| portfolio aReceptiveAccount anotherReceptiveAccount |
	
	portfolio := Portfolio new.
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.

	portfolio add: aReceptiveAccount.
	portfolio add: anotherReceptiveAccount.	
	
	self deposit: 100 * peso on: aReceptiveAccount.
	self deposit: 200 * peso on: anotherReceptiveAccount.		
	
	self assert: 2 equals: portfolio transactions size.
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BB 6/7/2022 20:38:50'!
test21PortfolioCanAddAnEmptyPortfolio
	
	| portfolio anotherPortfolio |
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.	
		
	portfolio add: anotherPortfolio.
	
	self assert: 0 * peso equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BB 6/7/2022 20:38:43'!
test22PortfolioCanAddAPortfolioAndTheirBalancesAreTheSame
	
	| portfolio anotherPortfolio aReceptiveAccount |
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.	
		
	portfolio add: anotherPortfolio.
	
	aReceptiveAccount := ReceptiveAccount new.
	self deposit: 100 * peso on: aReceptiveAccount.
	
	anotherPortfolio add: aReceptiveAccount.
	
	self assert: 100 * peso equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BB 6/7/2022 20:36:42'!
test23PortfolioCanHaveMultiplePortfoliosAndSumBalances
	
	| portfolio childPortfolio anotherChildPortfolio anAccount anotherAccount |
	
	portfolio := Portfolio new.
	
	childPortfolio := Portfolio new.
	anotherChildPortfolio := Portfolio new.	
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	self deposit: 100 * peso on: anAccount.
	self deposit: 200 * peso on: anotherAccount.

	childPortfolio add: anAccount.
	anotherChildPortfolio add: anotherAccount. 
	
	portfolio add: childPortfolio.
	portfolio add: anotherChildPortfolio.
	
	self assert: 300 * peso equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BB 6/7/2022 20:37:43'!
test24PortfolioCanHaveMultiplePortfoliosAndAccounts
	
	| portfolio childPortfolio aReceptiveAccount childPortfolioReceptiveAccount |
	
	portfolio := Portfolio new.
	childPortfolio := Portfolio new.	
	aReceptiveAccount := ReceptiveAccount new.
	childPortfolioReceptiveAccount := ReceptiveAccount new.
	
	self deposit: 100 * peso on: aReceptiveAccount.
	self deposit: 200 * peso on: childPortfolioReceptiveAccount.

	portfolio add: aReceptiveAccount.
	childPortfolio add: childPortfolioReceptiveAccount. 
	
	portfolio add: childPortfolio.
	
	self assert: 300 * peso equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BB 6/7/2022 20:46:38'!
test25PortfolioKnowsRegisteredTransactionsInChildPortfolio
	
	| portfolio anotherPortfolio aReceptiveAccount deposit |
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.	
		
	portfolio add: anotherPortfolio.
	
	aReceptiveAccount := ReceptiveAccount new.
	deposit := self deposit: 100 * peso on: aReceptiveAccount.
	
	anotherPortfolio add: aReceptiveAccount.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'BB 6/7/2022 20:55:18'!
test26PortfolioWithMultiplePortfoliosKnowsAllTransactions
	
	| portfolio childPortfolio anotherChildPortfolio anAccount anotherAccount |
	
	portfolio := Portfolio new.
	
	childPortfolio := Portfolio new.
	anotherChildPortfolio := Portfolio new.	
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	self deposit: 100 * peso on: anAccount.
	self deposit: 200 * peso on: anotherAccount.

	childPortfolio add: anAccount.
	anotherChildPortfolio add: anotherAccount. 
	
	portfolio add: childPortfolio.
	portfolio add: anotherChildPortfolio.
	
	self assert: 2 equals: portfolio transactions size.
	! !


!PortfolioTest methodsFor: 'private' stamp: 'LA 6/6/2022 21:27:25'!
deposit: anAmount on: anAccount
	
	^Deposit register: anAmount on: anAccount ! !


!PortfolioTest methodsFor: 'tests extra' stamp: 'BB 6/7/2022 21:47:25'!
test27APortfolioCanNotHaveTheSameReceptiveAccount

	| receptiveAccount portfolio |
	
	receptiveAccount := ReceptiveAccount new.
	portfolio := Portfolio new.
	
	portfolio add: receptiveAccount.
	
	self should: [portfolio add: receptiveAccount.]
		raise: Error
		withMessageText: 'This Account is already included in this portfolio!!'.
	
	
	! !

!PortfolioTest methodsFor: 'tests extra' stamp: 'BB 6/7/2022 22:14:25'!
test28APortfolioCanNotIncludeTheSamePortfolioTwice

	| childPortfolio portfolio |
	
	portfolio := Portfolio new.
	childPortfolio := Portfolio new.
	
	portfolio add: childPortfolio .
	
	self should: [portfolio add: childPortfolio ]
		raise: Error
		withMessageText: 'This Account is already included in this portfolio!!'.
	
	
	! !

!PortfolioTest methodsFor: 'tests extra' stamp: 'BB 6/7/2022 22:14:38'!
test29APortfolioCanNotAddAReceptiveAccountAlreadyIncludedInAPreviouslyAddedPortfolio

	| receptiveAccount portfolio childPortfolio |
	
	receptiveAccount := ReceptiveAccount new.
	portfolio := Portfolio new.
	childPortfolio := Portfolio new.
	
	childPortfolio add: receptiveAccount.
	
	portfolio add: childPortfolio.
	
	self should: [portfolio add: receptiveAccount.]
		raise: Error
		withMessageText: 'This Account is already included in this portfolio!!'.
	
	
	! !

!PortfolioTest methodsFor: 'tests extra' stamp: 'BB 6/7/2022 22:17:09'!
test30APortfolioCanNotAddAPortfolioAlreadyIncludedInAPreviouslyAddedPortfolio

	| grandsonPortfolio portfolio childPortfolio |
	
	portfolio := Portfolio new.
	childPortfolio := Portfolio new.
	grandsonPortfolio := Portfolio new.
	
	childPortfolio add: grandsonPortfolio .
	
	portfolio add: childPortfolio.
	
	self should: [portfolio add: grandsonPortfolio]
		raise: Error
		withMessageText: 'This Account is already included in this portfolio!!'.
	
	
	! !

!PortfolioTest methodsFor: 'tests extra' stamp: 'BB 6/7/2022 22:17:23'!
test31APortfolioCanNotIncludeItself

	| portfolio |
	
	portfolio := Portfolio new.
	
	self should: [portfolio add: portfolio.]
		raise: Error
		withMessageText: 'A Portfolio Can Not Be Included In Itself!!'.
	
	
	! !


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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/7/2022 19:10:02'!
test04WithdrawValueMustBePositive 

	| withdrawValue extractedAmount |
	
	withdrawValue := 50 * peso.
	
	extractedAmount := self withdrawOnAccount: withdrawValue.
	
	self assert: withdrawValue equals: extractedAmount value
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BB 6/7/2022 17:31:30'!
test07AccountKnowsItsTransactions 

	| deposit |
	
	deposit := self depositOnAccount: 50 * peso.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/7/2022 19:16:49'!
test08NeitherDepositsNorWithdrawsCanHaveZeroAmount

	self should: [self depositOnAccount: 0 * peso]
		raise: Error
		withMessageText: 'Transactions amount must be positive!!'.

	self should: [self withdrawOnAccount: 0 * peso]
		raise: Error
		withMessageText: 'Transactions amount must be positive!!'.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/7/2022 19:17:26'!
test09NeitherDepositsNorWithdrawsCanHaveNegativeAmount

	self should: [self depositOnAccount: -10 * peso]
		raise: Error
		withMessageText: 'Transactions amount must be positive!!'.

	self should: [self withdrawOnAccount: -10 * peso]
		raise: Error
		withMessageText: 'Transactions amount must be positive!!'.
! !


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

!TransferenceTest methodsFor: 'tests' stamp: 'BB 6/7/2022 19:27:21'!
test12BothPartsRegisteredTheirTransferenceLeg

	| transference |
	
	transference := self transfer: 75 * peso.
		
	self assert: (senderAccount hasRegistered: transference withdrawLeg).
	self assert: (receiverAccount hasRegistered: transference depositLeg).
	
! !

!TransferenceTest methodsFor: 'tests' stamp: 'LA 6/7/2022 15:36:09'!
test13BothTransferenceLegsKnowTheirCounterpart

	| transference depositLeg withdrawLeg |
		
	transference := self transfer: 75 * peso.
	
	withdrawLeg := transference withdrawLeg.
	depositLeg := transference depositLeg.		
	
	self assertCounterpartOf: withdrawLeg is: depositLeg.
	self assertCounterpartOf: depositLeg is: withdrawLeg.
! !

!TransferenceTest methodsFor: 'tests' stamp: 'LA 6/7/2022 19:16:42'!
test14TransferencesCannotHaveZeroAmount

	self should: [self transfer: 0 * peso]
		raise: Error
		withMessageText: 'Transactions amount must be positive!!'.
			! !

!TransferenceTest methodsFor: 'tests' stamp: 'LA 6/7/2022 19:16:33'!
test15TransferencesCannotHaveNegativeAmount

	self should: [self transfer: -10 * peso]
		raise: Error
		withMessageText: 'Transactions amount must be positive!!'.
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

!AccountTransaction methodsFor: 'accessing' stamp: 'LA 6/7/2022 19:10:32'!
value 

	^value! !


!AccountTransaction methodsFor: 'initialization' stamp: 'LA 6/7/2022 19:16:14'!
initializeFor: aValue

	(aValue <= 0) ifTrue: [self error: 'Transactions amount must be positive!!'].

	value := aValue ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:54:51'!
transactionValue

	^ self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LA 6/7/2022 19:19:14'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #DepositTransference category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #DepositTransference
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositTransference methodsFor: 'initialization' stamp: 'LA 6/7/2022 19:11:50'!
initializeFor: aValue AsLegOf: aTransference 

	transference := aTransference. 
	
	self initializeFor: aValue.! !


!DepositTransference methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:46:45'!
counterpart

	^transference counterpartOf: self.! !

!DepositTransference methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:43:17'!
transactionValue

	^ self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositTransference class' category: 'ServiciosFinancieros-Ejercicio'!
DepositTransference class
	instanceVariableNames: ''!

!DepositTransference class methodsFor: 'instance creation' stamp: 'LA 6/7/2022 19:13:19'!
register: aValue asLegOf: aTransference on: anAccount 

	| depositTransference |
	
	depositTransference := self new initializeFor: aValue AsLegOf: aTransference.
	anAccount register: depositTransference.
		
	^ depositTransference
	! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:55:17'!
transactionValue

	^self value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LA 6/7/2022 19:19:20'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #WithdrawTransference category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #WithdrawTransference
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawTransference methodsFor: 'initialization' stamp: 'LA 6/7/2022 19:12:28'!
initializeFor: aValue AsLegOf: aTransference

	transference := aTransference. 
	
	self initializeFor: aValue.! !


!WithdrawTransference methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:47:25'!
counterpart

	^transference counterpartOf: self.! !

!WithdrawTransference methodsFor: 'accessing' stamp: 'LA 6/6/2022 20:42:52'!
transactionValue

	^self value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawTransference class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawTransference class
	instanceVariableNames: ''!

!WithdrawTransference class methodsFor: 'instance creation' stamp: 'LA 6/7/2022 19:13:52'!
register: aValue asLegOf: aTransference on: anAccount 

	| depositTransference |
	
	depositTransference := self new initializeFor: aValue AsLegOf: aTransference.
	anAccount register: depositTransference.
		
	^ depositTransference
	! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'BB 6/7/2022 19:38:50'!
initialize

	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'testing' stamp: 'BB 6/7/2022 19:58:00'!
hasRegistered: aTransaction
		
	^accounts anySatisfy: [ :account | account hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'BB 6/7/2022 21:36:45'!
includes: anAccount
		
	^accounts anySatisfy: [ :account | (account = anAccount) or: (account includes: anAccount)]! !


!Portfolio methodsFor: 'main protocol' stamp: 'BB 6/7/2022 22:06:42'!
add: anAccount 

	(self includes: anAccount) ifTrue: [self error: self class accountIsAlreadyIncludedDescription].
	(self = 	anAccount) ifTrue: [self error: self class portfolioCanNotIncludeItselfDescription].
	
	accounts addLast: anAccount ! !

!Portfolio methodsFor: 'main protocol' stamp: 'BB 6/7/2022 20:40:42'!
balance

	^accounts sum: [:account | account balance] ifEmpty: 0.
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'BB 6/7/2022 20:07:41'!
transactions
		
	| allTransactions |
	
	allTransactions := OrderedCollection new.
	
	accounts do: [ :anAccount | allTransactions addAllLast: anAccount transactions].
	
	^allTransactions. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'BB 6/7/2022 22:06:42'!
accountIsAlreadyIncludedDescription

	^'This Account is already included in this portfolio!!'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'BB 6/7/2022 22:07:07'!
portfolioCanNotIncludeItselfDescription

	^'A Portfolio Can Not Be Included In Itself!!'.! !


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

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'BB 6/7/2022 21:35:01'!
includes: anAccount

	^false.! !

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

!Transference methodsFor: 'initialization' stamp: 'LA 6/7/2022 19:14:29'!
initializeFrom: aSenderAccount to: aReceiverAccount amount: anAmountToTransfer 

	value := anAmountToTransfer.
	depositLeg := DepositTransference register: anAmountToTransfer asLegOf: self on: aReceiverAccount .
	withdrawLeg := WithdrawTransference register: anAmountToTransfer asLegOf: self on: aSenderAccount .! !


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
