How to customize:

Add the @Loggable annotation to any method (constructor, getter, setter...) that needs the Logging logic utilized.
The annotation defined in the aspect file will do the rest.

how to run:

ajc -1.5 woven_bankwithlogging/*.java woven_bankwithlogging/*.aj

java woven_bankwithlogging.BankWithLogging