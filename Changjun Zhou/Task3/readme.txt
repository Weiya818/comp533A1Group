To create an aspect, create an aspect that implements the Loggable abstract aspect, then inside it declare parent "your Class" implements ILoggable. Then, it i s time to create point cuts. There are two pointcut available in abstract loggable. publicCall and constructCall, first one for usual functions, second one for constructors. Override these two pointcuts then try to run your program. 

To compile: (notes: I have to mention that I did not make the command line (ajc) on my computer work. I did this assignment on eclipse, so I cannot be sure if the commands below would work)

ajc Account.java AccountActionListener.java AccountListener.java BankWithLogging.java Customer.java CustomerListener.java Loggable.aj Logger.java NotEnoughFundsException.java

java BankWithLogging
