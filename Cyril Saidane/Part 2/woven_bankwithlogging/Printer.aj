package woven_bankwithlogging;


public aspect Printer {
	
pointcut constructorcall(Account a) :
	initialization(public * .new(..)) && target(a);

after(Account a): constructorcall(a) {
	String stringToLog = "Created object " + a.owner;
	System.out.println(stringToLog);
}

pointcut depositcall(Account a) :
	call(public * Account.deposit(..)) && target(a);

after(Account a): depositcall(a) {
	String stringToLog = "deposit called on object " + a + " with parameter " + a.balanceInCents;
	System.out.println(stringToLog);
}

pointcut withdrawcall(Account a) :
	call(public * Account.withdraw(..)) && target(a);

after(Account a): withdrawcall(a) {
	String stringToLog = "withdraw called on object " + a + " with parameter " + a.balanceInCents;
	System.out.println(stringToLog);
}

pointcut customerconstruct(Customer c) :
	initialization(public * .new(..)) && target(c);

after(Customer c): customerconstruct(c) {
	String stringToLog = "Created object " + c.name;
	System.out.println(stringToLog);
}



}