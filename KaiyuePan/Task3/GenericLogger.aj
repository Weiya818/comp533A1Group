// Kaiyue Pan - 260627397

// annotation @NeedLogging(requireLogging = true) is added to business classes or methods that need logging
@interface NeedLogging {
	public boolean requireLogging() default false;
}

public aspect GenericLogger {

	void logNow(String message) {
		System.out.println(message);
	}

	// Display the log message after an Object is created
	// runs after calls to the specified constructor returns normally
	// return value is named "info" in the body
	after() returning (Object info): call(*.new(..)) && @annotation(NeedLogging) {
		String stringToLog = "Created object " + info;
		logNow(stringToLog);
	}

	// Display the log message before a method is executed
	// Create a pointcut that exposes the info on an Object
	pointcut callsToMethod(Object info) : 
    	call(* *(..)) && target(info) && @annotation(NeedLogging);

	// runs before the pointcut above is executed
	before(Object info) : callsToMethod(info) {
		String name = thisJoinPoint.getSignature().getName();
		Object[] argsList = thisJoinPoint.getArgs();
		String objectName = info.toString();
		
		String allArgs = "";
		for (int i = 0; i < argsList.length; i++) {
			allArgs += argsList[i].toString();
			// add comma if there are multiple args
			if (argsList.length > 1 && i != (argsList.length - 1)) {
				allArgs += ", ";
			}
		}

		String stringToLog = name + " called on object " + objectName + " with parameter " + allArgs;
		logNow(stringToLog);
	}

}
