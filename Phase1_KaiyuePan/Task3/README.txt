
* To customize the reusable module to his/her needs, a user can add annotation @NeedLogging(requireLogging = true) to business classes or methods that need logging.


* Since I am using a Mac, I compiled and ran my java and aspect code using the AspectJ plugin from Eclipse by selecting the package and clicking:

Run as -> AspectJ/Java Application



* Please compile the code in command line by using the following commands:

cd [to where the Task3 folder is located]

sudo ajc -cp [Path to aspectjrt.jar] -source 1.8 -target 1.8 Task3/*.java Task3/*.aj 



* Please run the code using the following command:

java Task3/BankWithLogging.java

