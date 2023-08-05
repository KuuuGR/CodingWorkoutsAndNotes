1. Github has no authentication method using password. So you need to generate PrivateAccess Token to have access to public repository
2. Additionally for private accounts there is a need to make SSH and connect your computer with GitHub
	1. Here are the step-by-step instructions to add your SSH key to your GitHub account on your MacBook:
		1. **Check for Existing SSH Keys:** 
			First, you'll want to check if you already have an SSH key on your MacBook. Open the Terminal application (you can find it in the Utilities folder within the Applications folder or use Spotlight search to find it), and enter the following command:
			```bash
ls ~/.ssh/id_rsa.pub
```
			This command will check if there's an existing public key. If you see a message like "No such file or directory," it means you don't have an existing key, and you can skip to Step 3. If you already have a key, you can use it, or you may want to generate a new one if you prefer.
		2. **Generate a New SSH Key (Optional):** 
			If you don't have an existing SSH key or want to generate a new one, you can do so using the following command:
			```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
			Replace `your_email@example.com` with the email associated with your GitHub account. Press Enter to run the command, and you'll be prompted to choose a location to save the key. The default location `~/.ssh/id_rsa` is usually fine, so you can press Enter again.

			You'll also be prompted to set a passphrase for the key. It's optional but recommended for added security. Remember this passphrase, as you'll need it whenever you use the SSH key.
		3. **Copy Your Public Key:** 
			Use the following command to copy the public key to your clipboard:
			```bash
pbcopy < ~/.ssh/id_rsa.pub
```
			This command will copy the content of the public key to the clipboard, allowing you to easily paste it.
		4. **Add the SSH Key to Your GitHub Account:**
		    - Go to the GitHub website ([https://github.com/](https://github.com/)) and log in to your account if you haven't already.
		    - Click on your profile picture in the top-right corner and select "Settings."
		    - In the left sidebar, click on "SSH and GPG keys."
		    - Click on the green button labeled "New SSH key."
		    - Give your SSH key a title (e.g., "MacBook SSH Key").
		    - Now, paste the copied public key into the "Key" field. To paste it, press Command (⌘) + V.
		    - Finally, click on the "Add SSH key" button to save the key to your GitHub account.
	    5. **Test the SSH Connection:** 
		    To test the SSH connection, run the following command in the Terminal:
```bash
ssh -T git@github.com
```
If everything is set up correctly, you should see a message like:
```bash
Hi username! You've successfully authenticated...
```
    This indicates that your SSH key is now correctly added to your GitHub account.
That's it! Your SSH key is now associated with your GitHub account, and you can use it for secure authentication when interacting with GitHub repositories over SSH.

