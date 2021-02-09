package bankwithlogging;

public aspect LoggerPoint {
	  
	  after(Account a,int amount): 
		  call(void Account.deposit*(*)) && target(a) && args(amount){
		  
	      String stringToLog = "deposit called on object " + a + " with parameter "+amount;
	      Logger.log(stringToLog);
	  }
	  
	  after(Account a,int amount): 
		  call(void Account.withdraw*(*)) && target(a) && args(amount){
		  
	      String stringToLog = "withdraw called on object " + a + " with parameter "+amount;
	      Logger.log(stringToLog);
	  }


	  after() returning(Account a): 
		  call(Account.new(..)){
		  
	      String stringToLog = "Created object " +a;
	      Logger.log(stringToLog);
	  }
	  
	  after() returning(Customer a): 
		  call(Customer.new(..)){
		  
	      String stringToLog = "Created object " +a;
	      Logger.log(stringToLog);
	  }
}
