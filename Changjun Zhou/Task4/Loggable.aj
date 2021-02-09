package AnimalAndLog;

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


aspect LoggableAnimal extends Loggable {
	declare parents: Animal implements ILoggable;
	public pointcut publicCall(ILoggable l):
	 call(* Animal.hearSound*(*))  && target(l);
	
	public pointcut constructCall():
		 call(Animal.new(..));
}

