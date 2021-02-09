// task 2

public aspect LoggerWithAspect {
	
	pointcut deposit(Account currentAccount, int amount):
	    call(void Account.deposit(int))
	    && target(currentAccount)
	    && args(amount);
	
	pointcut withdraw(Account currentAccount, int amount):
	    call(void Account.withdraw(int))
	    && target(currentAccount)
	    && args(amount);
	
	pointcut account(Account currentAccount):
		initialization(Account.new(..)) && target(currentAccount);
	
	pointcut customer(Customer currentCustomer):
		initialization(Customer.new(..)) && target(currentCustomer);
	
	
	before(Account currentAccount, int amount) : deposit(currentAccount, amount) {
	    System.out.println("deposit called on object " + currentAccount.toString() + " with parameter " + amount);
	}

	before(Account currentAccount, int amount) : withdraw(currentAccount, amount) {
	    System.out.println("withdraw called on object " + currentAccount.toString() + " with parameter " + amount);
	}
	
	after(Account currentAccount) : account(currentAccount) {
		System.out.println("Created object " + currentAccount.toString());
	}
	
	after(Customer currentCustomer) : customer(currentCustomer) {
		System.out.println("Created object " + currentCustomer.toString());
	}
	
}
