!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: 'receptiveAccount portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'setup' stamp: 'BB 6/16/2022 15:57:56'!
setUp

	receptiveAccount := ReceptiveAccount new.
	portfolio := Portfolio new.! !


!AccountSummaryTest methodsFor: 'tests' stamp: 'BB 6/16/2022 15:53:58'!
test01AnAccountSummaryForAReceptiveAccountWithoutTransactionsOnlyShowsBalanceIsZero

	| report |
	
	report := AccountSummary for: receptiveAccount.
	
	self assert: report generate equals: 'Balance = 0 * pesos'! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'BB 6/16/2022 15:53:58'!
test02AnAccountSummaryForAReceptiveAccountWithATransactionListsItAndCalculatesBalance

	| report |
	
	Deposit register: 100 * peso on: receptiveAccount .
	report := AccountSummary for: receptiveAccount .
	
	self assert: report generate equals:  
'Depósito por 100 * pesos
Balance = 100 * pesos'! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'BB 6/16/2022 15:57:56'!
test03AnAccountSummaryForAPortfolioWithoutTransactionsOnlyShowsBalanceIsZero

	| report |
	
	portfolio add: receptiveAccount .
	
	report := AccountSummary for: portfolio.
	
	self assert: report generate equals: 'Balance = 0 * pesos'! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'BB 6/16/2022 15:57:56'!
test04AnAccountSummaryForAPortfolioWithATransactionListsItAndCalculatesBalance

	| report |
	
	portfolio add: receptiveAccount .
	
	Deposit register: 100 * peso on: receptiveAccount .
	
	report := AccountSummary for: portfolio .
	
	self assert: report generate equals:  
'Depósito por 100 * pesos
Balance = 100 * pesos'! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'BB 6/16/2022 15:53:58'!
test05AnAccountSummaryCanShowNegativeBalance

	| report |

	Withdraw register: 100 * peso on: receptiveAccount .
	report := AccountSummary for: receptiveAccount .
	
	self assert: report generate equals:  
'Extracción por 100 * pesos
Balance = -100 * pesos'! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'BB 6/16/2022 15:53:58'!
test06AnAccountSummaryForAReceptiveAccountWithManyTransactionListAllTransactionsAndBalance

	| report anotherReceptiveAccount |

	anotherReceptiveAccount := ReceptiveAccount new.	

	Deposit register: 100 * peso on: receptiveAccount .
	Withdraw register: 50 * peso on: receptiveAccount .
	Transfer amount: 20 * peso from: receptiveAccount to: anotherReceptiveAccount.
	Transfer amount: 30 * peso from: anotherReceptiveAccount to: receptiveAccount .	
		
	report := AccountSummary for: receptiveAccount .
	
	self assert: report generate equals:  
'Depósito por 100 * pesos
Extracción por 50 * pesos
Salida por transferencia de 20 * pesos
Entrada por transferencia de 30 * pesos
Balance = 60 * pesos'
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'BB 6/16/2022 15:57:56'!
test07AnAccountSummaryForAPortfolioWithManyTransactionsFromManyAccountsListAllTransactionsAndBalance

	| report anotherReceptiveAccount anotherPortfolio |
	
	anotherReceptiveAccount := ReceptiveAccount new.	

	Deposit register: 100 * peso on: receptiveAccount.
	Withdraw register: 50 * peso on: receptiveAccount.
	Transfer amount: 20 * peso from: receptiveAccount to: anotherReceptiveAccount.
	Transfer amount: 30 * peso from: anotherReceptiveAccount to: receptiveAccount.	
	
	anotherPortfolio := Portfolio new.
	
	anotherPortfolio add: anotherReceptiveAccount.
	portfolio add: receptiveAccount.
	portfolio add: anotherPortfolio.
		
	report := AccountSummary for: portfolio .
	
	self assert: report generate equals:  
'Depósito por 100 * pesos
Extracción por 50 * pesos
Salida por transferencia de 20 * pesos
Entrada por transferencia de 30 * pesos
Entrada por transferencia de 20 * pesos
Salida por transferencia de 30 * pesos
Balance = 50 * pesos'
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'BB 6/16/2022 15:57:44'!
test08AnAccountSummaryCanIdentifyDifferentTransactionsWithTheSameNature

	| report |
	
	Deposit register: 100 * peso on: receptiveAccount .
	Deposit register: 50 * peso on: receptiveAccount .
		
	report := AccountSummary for: receptiveAccount .
	
	self assert: report generate equals:  
'Depósito por 100 * pesos
Depósito por 50 * pesos
Balance = 150 * pesos'
! !


!classDefinition: #PortfolioDetailedTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioDetailedTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'BB 6/16/2022 00:01:07'!
test01PDTPForAnEmptyPortfolioPrintsThePortfoliosNameAndBalanceEqualToZero

	|  report |
	
	report := PortfolioDetailedTreePrinter for: (Portfolio named: 'Mi Portfolio').
	
	self assert: report generate equals:
'Mi Portfolio
	Balance = 0 * pesos'! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'BB 6/16/2022 00:00:52'!
test02PDTPForAPortfolioWithAReceptiveAccountWithNoTransactionsPrintsTheTreeWithThreeLevelsAndBalanceEqualToZero

	|  report receptiveAccount |
	
	receptiveAccount := ReceptiveAccount named: 'Cuenta Personal'.
	
	report := PortfolioDetailedTreePrinter for: (Portfolio named: 'Mi Portfolio' with: receptiveAccount).
	
	self assert: report generate equals:
'Mi Portfolio
	Cuenta Personal
		Balance = 0 * pesos
	Balance = 0 * pesos'! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'BB 6/16/2022 00:28:47'!
test03PDTPForAPortfolioWithAReceptiveAccountWithTransactionsPrintsTheTreeWithThreeLevels

	|  report receptiveAccount |
	
	receptiveAccount := ReceptiveAccount named: 'Cuenta Personal'.
	Deposit register: 100 * peso on: receptiveAccount. 
	
	report := PortfolioDetailedTreePrinter for: (Portfolio named: 'Mi Portfolio' with: receptiveAccount).
	
	self assert: report generate equals:
'Mi Portfolio
	Cuenta Personal
		Depósito por 100 * pesos
		Balance = 100 * pesos
	Balance = 100 * pesos'! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'BB 6/16/2022 00:32:06'!
test04PDTPForAPortfolioWithAPortfolioPrintsTheTreeWithThreeLevels

	|  report childPortfolio |
	
	childPortfolio := Portfolio named: 'Portfolio Secundario'.
	report := PortfolioDetailedTreePrinter for: (Portfolio named: 'Mi Portfolio' with: childPortfolio).
	
	self assert: report generate equals:
'Mi Portfolio
	Portfolio Secundario
		Balance = 0 * pesos
	Balance = 0 * pesos'! !

!PortfolioDetailedTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'BB 6/16/2022 00:46:57'!
test05PDTPForAPortfolioWithAPortfolioPrintsTheTreeWithThreeLevels

	| angelesAccount childrenPortfolio familyPortfolio juanAccount personalAccount report |
	personalAccount := ReceptiveAccount named: 'Cuenta Personal'.
	juanAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angelesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.

	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: juanAccount with: angelesAccount.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: personalAccount with: childrenPortfolio.

	Deposit register: 150 * peso on: personalAccount.
	Deposit register: 100 * peso on: juanAccount.
	Withdraw register: 50 * peso on: juanAccount.

	Transfer amount: 25 * peso from: personalAccount to: angelesAccount.
	
	report := PortfolioDetailedTreePrinter for: familyPortfolio.

	self assert: report generate equals: 
'Portfolio de la familia
	Cuenta Personal
		Depósito por 150 * pesos
		Salida por transferencia de 25 * pesos
		Balance = 125 * pesos
	Portfolio de hijos
		Cuenta de Juan
			Depósito por 100 * pesos
			Extracción por 50 * pesos
			Balance = 50 * pesos
		Cuenta de Angeles
			Entrada por transferencia de 25 * pesos
			Balance = 25 * pesos
		Balance = 75 * pesos
	Balance = 200 * pesos'.! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'BB 6/16/2022 00:01:31'!
test01PTPForAnEmptyPortfolioPrintsThePortfoliosNameAndBalanceEqualToZero

	|  report |
	
	report := PortfolioTreePrinter for: (Portfolio named: 'Mi Portfolio').
	
	self assert: report generate equals: 'Mi Portfolio'! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'BB 6/16/2022 00:01:39'!
test02PTPForAPortfolioWithAReceptiveAccountWithNoTransactionsPrintsTheTreeWithThreeLevelsAndBalanceEqualToZero

	|  report receptiveAccount |
	
	receptiveAccount := ReceptiveAccount named: 'Cuenta Personal'.
	
	report := PortfolioTreePrinter for: (Portfolio named: 'Mi Portfolio' with: receptiveAccount).
	
	self assert: report generate equals:
'Mi Portfolio
	Cuenta Personal'! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'BB 6/15/2022 23:32:08'!
test03PTPForAPortfolioWithReceptiveAccountsPrintsTheTreeWithTwoLevels

	|  report receptiveAccount anotherReceptiveAccount |
	
	receptiveAccount := ReceptiveAccount named: 'Cuenta Personal'.
	anotherReceptiveAccount := ReceptiveAccount named: 'Cuenta Offshore'.
	
	report := PortfolioTreePrinter for: (Portfolio named: 'Mi Portfolio' with: receptiveAccount with: anotherReceptiveAccount).
	
	self assert: report generate equals:
'Mi Portfolio
	Cuenta Personal
	Cuenta Offshore'! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'BB 6/15/2022 23:31:00'!
test04PTPForAPortfolioWithAChildPortfolioPrintsTheTreeWithThreeLevels

	|  report receptiveAccount childPortfolio |
	
	receptiveAccount := ReceptiveAccount named: 'Cuenta Personal'.
	childPortfolio := Portfolio named: 'Mi Sub Portfolio' with: receptiveAccount .
	
	report := PortfolioTreePrinter for: (Portfolio named: 'Mi Portfolio' with: childPortfolio).
	
	self assert: report generate equals:
'Mi Portfolio
	Mi Sub Portfolio
		Cuenta Personal'! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'BB 6/15/2022 23:37:07'!
test05PTPForAPortfolioWithAChildPortfolioPrintsTheTreeWithThreeLevels
	
	| angiesAccount childrenPortfolio johnsAccount myAccount report |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	
	report := PortfolioTreePrinter for: (Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio).
	
	self assert: report generate equals:
'Portfolio de la familia
	Cuenta mia
	Portfolio de hijos
		Cuenta de Juan
		Cuenta de Angeles'! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'LA 6/11/2022 22:09:53'!
test01ATransferNetForAReceptiveAccountWithoutTransactionsReturnsZero

	| account report |
	account := ReceptiveAccount new.
	
	report := TransferNet for: account.
	
	self assert: report generate equals: 0 * peso! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'LA 6/11/2022 21:44:00'!
test02ATransferNetForAReceptiveAccountWithOnlyTransferencesReturnsBalance

	| account anotherAccount report |
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Transfer amount: 100 * peso from: anotherAccount to: account.
	
	report := TransferNet for: account.
	
	self assert: report generate equals: 100 * peso! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'LA 6/11/2022 21:44:29'!
test03ATransferNetForAReceptiveAccountWithNoTransferencesReturnsZero

	| account report |
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	
	report := TransferNet for: account.
	
	self assert: report generate equals: 0 * peso! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'LA 6/11/2022 22:06:53'!
test04ATransferNetForAReceptiveAccountWithAllKindOfTransactionsOnlySumsTransfers

	| account anotherAccount report |

	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	Transfer amount: 50 * peso from: account to: anotherAccount.
	Withdraw register: 25 * peso on: account.
	Transfer amount: 75 * peso from: anotherAccount to: account.
	
	report := TransferNet for: account.
	
	self assert: report generate equals: 25 * peso! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'LA 6/11/2022 22:09:23'!
test05ATransferNetForAPortfolioWithoutTransactionsReturnsZero

	| account report portfolio |
	account := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	portfolio add: account.
	
	report := TransferNet for: account.
	
	self assert: report generate equals: 0 * peso! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'LA 6/11/2022 22:13:49'!
test06ATransferNetForAPortfolioWithOnlyTransferencesReturnsBalance

	| portfolio account anotherAccount report aThirdAccount |
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	aThirdAccount := ReceptiveAccount new.
		
	portfolio := Portfolio new.
	portfolio add: account.
	portfolio add: anotherAccount.
	
	Transfer amount: 100 * peso from: anotherAccount to: account.
	Transfer amount: 50 * peso from: aThirdAccount to: account.
	
	report := TransferNet for: portfolio.
	
	self assert: report generate equals: 50 * peso! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'LA 6/11/2022 22:15:14'!
test07ATransferNetForAPortfolioWithNoTransferencesReturnsZero

	| account report portfolio |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	
	Deposit register: 100 * peso on: account.
	
	report := TransferNet for: portfolio.
	
	self assert: report generate equals: 0 * peso! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'LA 6/11/2022 22:17:30'!
test08ATransferNetForAPortfolioWithAllKindOfTransactionsOnlySumsTransfers

	| portfolio account anotherAccount report aThirdAccount |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	aThirdAccount := ReceptiveAccount new.
	
	portfolio add: account.
	portfolio add: anotherAccount.
	
	Deposit register: 100 * peso on: account.
	Transfer amount: 50 * peso from: aThirdAccount to: anotherAccount.
	Withdraw register: 25 * peso on: account.
	Transfer amount: 75 * peso from: anotherAccount to: account.
	
	report := TransferNet for: portfolio.
	
	self assert: report generate equals: 50 * peso! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'LA 6/11/2022 22:08:24'!
test09ATransferNetCanBeNegative

	| account anotherAccount report |

	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Transfer amount: 50 * peso from: account to: anotherAccount.
	
	report := TransferNet for: account.
	
	self assert: report generate equals: -50 * peso! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'initialization' stamp: 'LA 6/15/2022 20:50:12'!
initialize

	self initializeWith: 'Unnamed'.! !

!Account methodsFor: 'initialization' stamp: 'LA 6/15/2022 20:50:34'!
initializeWith

	self subclassResponsibility ! !


!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'BB 6/15/2022 21:34:42'!
accept: anExpressionVisitor

	self subclassResponsibility.! !

!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'LA 6/15/2022 20:54:13'!
initializeWith: aName

	name := aName.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'LA 6/11/2022 19:58:45'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'BB 6/16/2022 00:52:51'!
accept: anExpressionVisitor

	^anExpressionVisitor visitPortfolio: self named: name with: accounts.! !

!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'LA 6/15/2022 20:55:39'!
named: aName

	^self new initializeWith: aName.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'LA 6/15/2022 21:00:34'!
named: aName with: anAccount

	| newPortfolio |
	newPortfolio := self named: aName.

	^newPortfolio
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'LA 6/15/2022 21:00:40'!
named: aName with: anAccount with: anotherAccount

	| newPortfolio |
	newPortfolio := self named: aName.

	^newPortfolio
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'LA 6/15/2022 20:58:53'!
with: anAccount

	^self named: 'Unnamed' with: anAccount.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'LA 6/15/2022 20:59:56'!
with: anAccount with: anotherAccount

	^self named: 'Unnamed' with: anAccount with: anotherAccount .! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'LA 6/15/2022 20:53:45'!
initializeWith: aName
	
	name := aName.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LA 6/11/2022 20:01:21'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]
		! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'BB 6/16/2022 00:17:10'!
accept: anExpressionVisitor

	^anExpressionVisitor visitReceptiveAccount: self named: name.! !

!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'LA 6/15/2022 20:47:27'!
named: aName

	^self new initializeWith: aName.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'private' stamp: 'BB 6/15/2022 21:34:25'!
accept: anExpressionVisitor

	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'private' stamp: 'LA 6/15/2022 20:23:03'!
accept: anExpressionVisitor

	^anExpressionVisitor visitDeposit: self.
	! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'private' stamp: 'LA 6/15/2022 20:24:42'!
accept: anExpressionVisitor

	^anExpressionVisitor visitTransferDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'private' stamp: 'LA 6/15/2022 20:25:10'!
accept: anExpressionVisitor

	^anExpressionVisitor visitTransferWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'private' stamp: 'LA 6/15/2022 20:25:40'!
accept: anExpressionVisitor

	^anExpressionVisitor visitWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'initialization' stamp: 'LA 6/15/2022 21:06:46'!
initializeFor: anAccount 

	self subclassResponsibility ! !


!Report methodsFor: 'main protocol' stamp: 'LA 6/11/2022 22:19:16'!
generate
	
	self subclassResponsibility.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-Solucion'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'LA 6/15/2022 21:05:01'!
for: anAccount 
	
	^self new initializeFor: anAccount ! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: 'transactions accountBalance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'initialization' stamp: 'BB 6/15/2022 21:50:57'!
initializeFor: anAccount

	transactions := anAccount transactions.
	accountBalance := anAccount balance.! !


!AccountSummary methodsFor: 'main protocol' stamp: 'BB 6/15/2022 21:51:44'!
generate

	| summaryLines |
	
	summaryLines := transactions collect: [:transaction | transaction accept: self ].
	
	summaryLines addLast: ('Balance = ', accountBalance asString).
	
	^self joinSummaryLines: summaryLines.
	
	! !


!AccountSummary methodsFor: 'private' stamp: 'LA 6/13/2022 20:14:26'!
joinSummaryLines: reportLines

	^ String newLineString join: reportLines! !

!AccountSummary methodsFor: 'private' stamp: 'BB 6/15/2022 21:52:55'!
visitDeposit: aDeposit 
	
	^'Depósito por ', aDeposit value asString.! !

!AccountSummary methodsFor: 'private' stamp: 'BB 6/15/2022 21:53:00'!
visitTransferDepositLeg: aTransferDepositLeg 
	
	^'Entrada por transferencia de ', aTransferDepositLeg value asString.! !

!AccountSummary methodsFor: 'private' stamp: 'BB 6/15/2022 21:53:05'!
visitTransferWithdrawLeg: aTransferWithdrawLeg 
	
	^'Salida por transferencia de ', aTransferWithdrawLeg value asString.! !

!AccountSummary methodsFor: 'private' stamp: 'BB 6/15/2022 21:53:10'!
visitWithdraw: aWithdraw 
	
	^'Extracción por ', aWithdraw value asString.! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'initialization' stamp: 'BB 6/15/2022 21:53:53'!
initializeFor: anAccount

	transactions := anAccount transactions.! !


!TransferNet methodsFor: 'main protocol' stamp: 'BB 6/15/2022 21:54:09'!
generate
	
	^transactions sum: [:transaction | transaction accept: self] ifEmpty: 0 * peso.
	
	! !


!TransferNet methodsFor: 'private' stamp: 'LA 6/15/2022 20:26:59'!
visitDeposit: aDeposit 
	
	^0! !

!TransferNet methodsFor: 'private' stamp: 'LA 6/15/2022 20:27:23'!
visitTransferDepositLeg: aTransferDepositLeg 
	
	^aTransferDepositLeg value.! !

!TransferNet methodsFor: 'private' stamp: 'LA 6/15/2022 20:27:46'!
visitTransferWithdrawLeg: aTransferWithdrawLeg 
	
	^aTransferWithdrawLeg value negated.! !

!TransferNet methodsFor: 'private' stamp: 'LA 6/15/2022 20:28:03'!
visitWithdraw: aWithdraw 
	
	^0.! !


!classDefinition: #TreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #TreePrinter
	instanceVariableNames: 'portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TreePrinter methodsFor: 'initialization' stamp: 'BB 6/15/2022 23:41:29'!
initializeFor: aPortfolio

	portfolio := aPortfolio.! !


!TreePrinter methodsFor: 'main protocol' stamp: 'BB 6/15/2022 23:41:29'!
generate

	^portfolio accept: self
	
	! !

!TreePrinter methodsFor: 'main protocol' stamp: 'BB 6/16/2022 00:51:43'!
visitPortfolio: aPortfolio named: aPortfolioName with: itsChildsAccounts

	self subclassResponsibility 
	
	
	
	
	
	
	
	! !

!TreePrinter methodsFor: 'main protocol' stamp: 'BB 6/16/2022 00:15:41'!
visitReceptiveAccount: aReceptiveAccount named: aReceptiveAccountName

	self subclassResponsibility.
	
	
	
	
	
	
	
	! !


!TreePrinter methodsFor: 'private' stamp: 'BB 6/15/2022 23:41:29'!
joinStringsWithEnters: reportLines

	^ String newLineString join: reportLines! !

!TreePrinter methodsFor: 'private' stamp: 'BB 6/15/2022 23:41:29'!
tabLines: aText
	
	| tabbedLines |
	tabbedLines := OrderedCollection new.
	
	aText linesDo: [:line | tabbedLines addLast: String tab , line].
	
	^self joinStringsWithEnters: tabbedLines
	
	! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
TreePrinter subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'main protocol' stamp: 'BB 6/16/2022 00:51:04'!
visitPortfolio: aPortfolio named: aPortfolioName with: itsChildsAccounts

	| childNames body bodyLines |
	
	childNames := itsChildsAccounts collect: [:childAccount | childAccount accept: self ].
	childNames ifEmpty: [^(aPortfolioName , '
	Balance = 0 * pesos') ].
	
	bodyLines := childNames copy.
	bodyLines addLast: 'Balance = ', aPortfolio balance asString.
	
	body := self joinStringsWithEnters: bodyLines.
	body := self tabLines: body.
	
	^self joinStringsWithEnters: (OrderedCollection with: aPortfolioName with: body).
	
	
	
	
	
	
	
	! !

!PortfolioDetailedTreePrinter methodsFor: 'main protocol' stamp: 'BB 6/16/2022 00:12:21'!
visitReceptiveAccount: aReceptiveAccount named: aReceptiveAccountName

	| accountSummary |
	
	accountSummary := (AccountSummary for: aReceptiveAccount) generate.
	accountSummary := self tabLines: accountSummary. 
	
	^self joinStringsWithEnters: (OrderedCollection with: aReceptiveAccountName with: accountSummary) 
		.! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
TreePrinter subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'BB 6/16/2022 00:51:24'!
visitPortfolio: aPortfolio named: aPortfolioName with: itsChildsAccounts

	| childNames body |
	
	childNames := itsChildsAccounts collect: [:childAccount | childAccount accept: self ].
	childNames ifEmpty: [^aPortfolioName ].
	
	body := self joinStringsWithEnters: childNames.
	body := self tabLines: body.
	
	^self joinStringsWithEnters: (OrderedCollection with: aPortfolioName with: body).
	
	
	
	
	
	
	
	! !

!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'BB 6/16/2022 00:16:20'!
visitReceptiveAccount: aReceptiveAccount named: aReceptiveAccountName

	^aReceptiveAccountName.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
