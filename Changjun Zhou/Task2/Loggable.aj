package bankwithlogging;

interface ILoggable {
	public void log(String logStr);
}
//"withdraw called on object " + a + " with parameter "+amount;
public abstract aspect Loggable {
	public abstract pointcut publicCall(ILoggable l);
	public abstract pointcut constructCall();
	public void ILoggable.log(String logStr){
		Logger.log(logStr);
	}
	
	after(ILoggable l): publicCall(l){
		Logger.log(thisJoinPoint.getSignature().getName()+" called on object " + l + " with parameter "+ thisJoinPoint.getArgs()[0].toString());
	}
	
	after() returning(ILoggable l): constructCall(){
	    String stringToLog = "Created object " +l;
	    Logger.log(stringToLog);	
	}
}


aspect LoggableAccount extends Loggable {
	declare parents: Account implements ILoggable;
	public pointcut publicCall(ILoggable l):
	 (call(void Account.withdraw*(*)) || call(void Account.deposit*(*))) && target(l);
	
	public pointcut constructCall():
		 call(Account.new(..));
}

aspect LoggableCustomer extends Loggable {
	declare parents: Customer implements ILoggable;
	public pointcut publicCall(ILoggable l);
	
	public pointcut constructCall():
		 call(Customer.new(..));
}
