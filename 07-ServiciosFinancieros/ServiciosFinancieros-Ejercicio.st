!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account senderAccount receiverAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/5/2022 17:44:57'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	
	self assertBalanceOf: account is: 0 * peso
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/5/2022 17:45:25'!
test02DepositIncreasesBalanceOnTransactionValue 

	self deposit: 100 * peso on: account.
		
	self assertBalanceOf: account is: 100 * peso. 
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/5/2022 17:52:21'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	self deposit: 100 * peso on: account.
	self withdraw: 50 * peso on: account.
		
	self assertBalanceOf: account is: 50 * peso

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/5/2022 17:46:58'!
test04WithdrawValueMustBePositive 

	| withdrawValue |
	
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/5/2022 17:43:16'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	deposit := self deposit: 100 * peso on: account.
	withdraw := self withdraw: 50 * peso on: account.
		
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/5/2022 17:41:13'!
test07AccountKnowsItsTransactions 

	| deposit |
	
	
	deposit := self deposit: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/5/2022 17:55:03'!
test08CanCreateATransferenceBetweenTwoAccounts

	| transference |
	
	self deposit: 100 * peso on: senderAccount.
	
	transference := Transference from: senderAccount to: receiverAccount amount: 75 * peso.
	
	self assert: 75 * peso equals: transference value.	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/5/2022 17:55:03'!
test09TransferenceDecreaseAndIncreaseBalanceOnTransferenceParts

	self deposit: 100 * peso on: senderAccount.
	
	Transference from: senderAccount to: receiverAccount amount: 75 * peso.
		
	self assertBalanceOf: senderAccount is: 25 * peso.
	self assertBalanceOf: receiverAccount is: 75 * peso.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/5/2022 17:55:03'!
test10BothPartsRegisteredTheirTransferenceLeg

	| transference |
	
	self deposit: 100 * peso on: senderAccount .
	
	transference := Transference from: senderAccount to: receiverAccount amount: 75 * peso.
		
	self assert: (senderAccount hasRegistered: transference withdrawLeg).
	self assert: (receiverAccount hasRegistered: transference depositLeg).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LA 6/5/2022 17:55:03'!
test11BothTransferenceLegsKnowTheirCounterpart

	| transference |
	
	self deposit: 100 * peso on: account.
	
	transference := Transference from: senderAccount to: receiverAccount amount: 75 * peso.
		
	self assert: transference withdrawLeg counterpart equals: transference depositLeg.
	self assert: transference depositLeg counterpart equals: transference withdrawLeg.! !


!ReceptiveAccountTest methodsFor: 'private' stamp: 'LA 6/5/2022 17:39:18'!
deposit: anAmount on: anAccount
	
	^Deposit register: anAmount on: anAccount ! !

!ReceptiveAccountTest methodsFor: 'private' stamp: 'LA 6/5/2022 17:56:36'!
transferFrom: aSenderAccount to: aReceiverAccount amount: anAmount
	
	^Transference from: aSenderAccount to: aReceiverAccount amount: anAmount! !

!ReceptiveAccountTest methodsFor: 'private' stamp: 'LA 6/5/2022 17:42:39'!
withdraw: anAmount on: anAccount
	
	^Withdraw register: anAmount on: anAccount ! !


!ReceptiveAccountTest methodsFor: 'assertions' stamp: 'LA 6/5/2022 17:44:40'!
assertBalanceOf: anAccount is: anAmount
	
	self assert: anAccount balance equals: anAmount ! !


!ReceptiveAccountTest methodsFor: 'setup' stamp: 'LA 6/5/2022 17:55:03'!
setUp
	
	account := ReceptiveAccount new.	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'accessing' stamp: 'LA 6/5/2022 16:34:00'!
transactionValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'accessing' stamp: 'LA 6/5/2022 16:33:34'!
value 

	^value ! !

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


!Deposit methodsFor: 'accessing' stamp: 'LA 6/5/2022 16:34:11'!
transactionValue

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
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositTransference methodsFor: 'initialization' stamp: 'LA 6/5/2022 16:45:47'!
initializeFor: aValue

	value := aValue ! !


!DepositTransference methodsFor: 'private' stamp: 'LA 6/5/2022 17:05:08'!
counterpartWith: aWithdrawTransference

	counterpart := aWithdrawTransference ! !


!DepositTransference methodsFor: 'accessing' stamp: 'LA 6/5/2022 17:27:12'!
counterpart

	^counterpart ! !

!DepositTransference methodsFor: 'accessing' stamp: 'LA 6/5/2022 16:47:27'!
transactionValue

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositTransference class' category: 'ServiciosFinancieros-Ejercicio'!
DepositTransference class
	instanceVariableNames: ''!

!DepositTransference class methodsFor: 'as yet unclassified' stamp: 'LA 6/5/2022 16:44:46'!
for: aValue
	
	^self new initializeFor: aValue.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'accessing' stamp: 'LA 6/5/2022 16:35:10'!
transactionValue

	^value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #WithdrawTransference category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #WithdrawTransference
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawTransference methodsFor: 'initialization' stamp: 'LA 6/5/2022 16:45:55'!
initializeFor: aValue

	value := aValue ! !


!WithdrawTransference methodsFor: 'private' stamp: 'LA 6/5/2022 17:05:35'!
counterpartWith: aDepositTransference

	counterpart := aDepositTransference ! !


!WithdrawTransference methodsFor: 'accessing' stamp: 'LA 6/5/2022 17:27:22'!
counterpart

	^counterpart! !

!WithdrawTransference methodsFor: 'accessing' stamp: 'LA 6/5/2022 16:47:35'!
transactionValue

	^ value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawTransference class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawTransference class
	instanceVariableNames: ''!

!WithdrawTransference class methodsFor: 'as yet unclassified' stamp: 'LA 6/5/2022 16:45:12'!
for: aValue
	
	^self new initializeFor: aValue.! !


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

!Transference methodsFor: 'initialization' stamp: 'LA 6/5/2022 17:57:14'!
initializeFrom: aSenderAccount to: aReceiverAccount amount: anAmountToTransfer 

	value := anAmountToTransfer.

	depositLeg := DepositTransference register: self value on: aReceiverAccount.
	withdrawLeg := WithdrawTransference register: self value on: aSenderAccount.
	
	depositLeg counterpartWith: withdrawLeg.
	withdrawLeg counterpartWith: depositLeg.	! !


!Transference methodsFor: 'accessing' stamp: 'LA 6/5/2022 17:26:36'!
depositLeg
	
	^depositLeg.! !

!Transference methodsFor: 'accessing' stamp: 'LA 6/5/2022 17:02:28'!
value
	
	^value.! !

!Transference methodsFor: 'accessing' stamp: 'LA 6/5/2022 17:26:45'!
withdrawLeg
	
	^withdrawLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'LA 6/5/2022 17:00:36'!
from: anAccountToGive to: anAccountToReceive amount: anAmountToTransfer 
	
	^self new initializeFrom: anAccountToGive to: anAccountToReceive amount: anAmountToTransfer ! !
