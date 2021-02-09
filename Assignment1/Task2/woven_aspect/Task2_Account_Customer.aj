package woven_aspect;

import woven_bankwithlogging.Logger;


public aspect Task2_Account_Customer {
	String stringToLog_create="Create Object:";
	String stringToLog_deposit="deposit called on object " ;
	String stringToLog_withdraw="withdraw called on object " ;
	
	//Constructor Customer
   pointcut CustomerPointCut(): execution(*.Customer.new(..));
	
   after(): CustomerPointCut(){
		Logger.log(stringToLog_create+thisJoinPoint.getThis().getClass());
	}
	
	//Constructor Account
    pointcut AccountPointCut(): execution(*.Account.new(..));
    
    after():AccountPointCut(){
    	Logger.log(stringToLog_create+thisJoinPoint.getThis().getClass());

   }
   
    //deposit method
    pointcut DepositPointCut(): execution(* *.deposit(..));
    
    before():DepositPointCut(){
    	Object[] paramValues = thisJoinPoint.getArgs();
    	Logger.log(stringToLog_deposit+thisJoinPoint.getThis().getClass()+" with parameter "+ paramValues[0] );

   }
   
    
    //withdraw method
    pointcut WithdrawPointCut(): execution(* *.withdraw(..));
    
    before():WithdrawPointCut(){
    	Object[] paramValues = thisJoinPoint.getArgs();
    	Logger.log(stringToLog_withdraw+thisJoinPoint.getThis().getClass()+ " with parameter " + paramValues[0] );

   }
   
 
    }	
    	
	