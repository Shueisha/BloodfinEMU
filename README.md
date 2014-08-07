TheDeli
=======

Where things get flashed, and Christmas never comes again.


Guide: If you need help, please contact Seefo

Step 1: Add your SSH key to your git account

	1. Enable the ability to view hidden files and folders: http://i.imgur.com/wQzZHA6.png
	
	2. Navigate to the '.ssh' folder in your home directory: http://i.imgur.com/WvsQw1f.png
	
	3. Open id_rsa.pub with gedit (it'll ask you to open it with a program, find gedit in the list: http://i.imgur.com/yGPxREw.png
	
	4. Copy the string within and add it to your git account (https://github.com/settings/ssh)
	
Step 2: Clone and set up the repository

	1. Open terminal and enter the following commands:
	
			cd ~/workspace/

			git clone git@github.com:mechsouls/theDeli.git
			
			rm MMOCoreORB
			
			ln -s theDeli/MMOCoreORB/ MMOCoreORB
			
			ln -s MMOEngine/ theDeli/MMOEngine
	
Step 3: You're done.

To commit: 
  cd ~/workspace/theDeli/
  
  git add *
  
  git commit -m "your commit message here"
  
  git push

To pull upstream changes:

   cd ~/workspace/theDeli/
   
   git pull
