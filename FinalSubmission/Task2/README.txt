We tested and ran our codes in MacOs:

1. Installed aspects-1.9.0.jar on Desktop. 

2. We modified the PATH by 'export PATH=$HOME/aspectj1.9/bin/:$PATH'

3. Then we used command 'export CLASSPATH=$HOME/aspectj1.9/lib/aspectjrt.jar:$CLASSPATH' command to include aspectjrt.jar on the class path.

Here are the steps to run our codes from command line. Make sure you are in FinalSubmission folder.

Task2:
1. ajc -1.5 Task2/*.java Task2/*.aj
2. java Task2.BankWithLogging
