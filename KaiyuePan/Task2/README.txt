* Since I am using a Mac, I compiled and ran my java and aspect code using the AspectJ plugin from Eclipse by selecting the package and clicking:

Run as -> AspectJ/Java Application



* Please compile the code in command line by using the following commands:

cd [to where the Task2 folder is located]

sudo ajc -cp [Path to aspectjrt.jar] -source 1.8 -target 1.8 Task2/*.java Task2/*.aj 



* Please run the code using the following command:

java Task2/BankWithLogging.java

