package woven_aspect;

import java.lang.reflect.Method;

import org.aspectj.lang.reflect.MethodSignature;

import woven_bankwithlogging.Logger;

public aspect Task3_aspect {
	
	String stringToLog_create="Create Object:";
	String stringToLog_call = "called on object ";
	

	
	pointcut ToAllConstructorPointCut():execution(@woven_aspect.ConsMonitor *.new(..));
	
	after(): ToAllConstructorPointCut(){
		
		Logger.log(stringToLog_create + thisJoinPoint.getThis().getClass());
		
	}
	
	
	pointcut ToAllMethodMonitorPointCut():execution(@woven_aspect.MethodMonitor * *(..));
	 
	 before():ToAllMethodMonitorPointCut() 
	 {
	 //generic type
	 Class<?> aClass = thisJoinPoint.getTarget().getClass();
	 
	 MethodSignature signature = (MethodSignature) thisJoinPoint.getSignature();
	
	 Method method=null;
	 String mStr=null;
	 
	 try 
	 {
		method = aClass.getDeclaredMethod(signature.getName(), signature.getParameterTypes());
		mStr=method.toString();
		
	 } catch (Exception e) {
		e.printStackTrace();
	 } 
	 
	 Object[] paramValues = thisJoinPoint.getArgs();
	 Logger.log(mStr+" "+stringToLog_call+thisJoinPoint.getThis().getClass()+" with parameter "+ paramValues[0] );
	      
	 }
	 
}
