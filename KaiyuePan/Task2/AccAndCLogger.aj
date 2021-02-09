// Kaiyue Pan - 260627397

public aspect AccAndCLogger {

	void logNow(String message) {
		System.out.println(message);
	}

	// Display the log message after an Account is created
	// runs after calls to Account constructor returns normally
	// return value is named "accInfo" in the body
	after() returning (Account accInfo): call(Account.new(..)) {
		String stringToLog = "Created object " + accInfo;
		logNow(stringToLog);
	}

	// Display the log message after a Customer is created
	// runs after calls to Customer constructor returns normally
	// return value is named "customerName" in the body
	after() returning (Customer customerName): call(Customer.new(..)) {
		String stringToLog = "Created object " + customerName;
		logNow(stringToLog);
	}

	// Display the log message before a deposit
	// Create a pointcut that exposes the accountInfo and amount deposited
	pointcut PublicCallsToDeposit(Account accInfo, int amount) : 
    	call(public * Account.deposit(..)) && target(accInfo) && args(amount);

	// runs before the pointcut above is executed
	before(Account accInfo, int amount) : PublicCallsToDeposit(accInfo, amount) {
		String stringToLog = "deposit called on object " + accInfo + " with parameter " + amount;
		logNow(stringToLog);
	}

	// Display the log message before a withdrawal
	// Create a pointcut that exposes the accountInfo and amount withdrew
	pointcut PublicCallsToWithdraw(int amount, Account accInfo) : 
    	call(public * Account.withdraw(..)) && target(accInfo) && args(amount);

	// runs before the pointcut above is executed
	before(int amount, Account accInfo) : PublicCallsToWithdraw(amount, accInfo) {
		String stringToLog = "withdraw called on object " + accInfo + " with parameter " + amount;
		logNow(stringToLog);
	}

}
