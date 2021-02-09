package woven_bankwithlogging;


@interface Loggable {}	

public aspect Logger {
	    
    public static void log(String message) {
        System.out.println(message);
    }
//pointcut constructorCall(Object obj) :
//	call(*.new(..)) && @annotation(Loggable);
//
//after(Object obj): constructorCall(obj) {
//	String stringToLog = "Created object " + obj;
//    Logger.log(stringToLog);
//}

   after() returning(Object object) : call(*.new(..)) && @annotation(Loggable) {
   	    String stringToLog = "Created object " + object;
        Logger.log(stringToLog);
    }
   

    pointcut handleMethod(Object object) : 
    	execution(* *(..)) && @annotation(Loggable) && target(object);
    
    before(Object object) : handleMethod(object) {
    	String arguments = "";
    	

    	for (Object arg : thisJoinPoint.getArgs()) {
    		arguments += arg.toString() + " ";
    	}
    	
    	String stringToLog = thisJoinPointStaticPart.getSignature().getName() +" called on object " + object + " with parameter " + arguments;
        Logger.log(stringToLog);
    }
}