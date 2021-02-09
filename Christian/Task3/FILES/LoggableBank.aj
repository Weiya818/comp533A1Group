// task 3
// Composition Specification

public aspect LoggableBank {

	declare parents : Account implements ILoggable;
	declare parents : Customer implements ILoggable;
	
	after(ILoggable l, Account currentAccount) : 
		(initialization(Account.new(..)) && target(currentAccount) && target(l))  {
		l.log("Created object " + currentAccount.toString());
	}
	
	after(ILoggable l, Customer currentCustomer) : 
		(initialization(Customer.new(..)) && target(currentCustomer) && target(l))  {
		l.log("Created object " + currentCustomer.toString());
	}
	
	before(ILoggable l, int amount, Account currentAccount) : 
		(call(public * Account.deposit(int)) 
			&& target(l)) 
			&& target(currentAccount) 
			&& args(amount) {
		l.log("deposit called on object " + currentAccount.toString() + " with parameter " + amount);
	}
	
	before(ILoggable l, int amount, Account currentAccount) : 
		(call(public * Account.withdraw(int)) 
			&& target(l)) 
			&& target(currentAccount) 
			&& args(amount) {
		l.log("withdraw called on object " + currentAccount.toString() + " with parameter " + amount);
	}
		
}
