
# TripAgvisor
### Project Description
***Experience Recommendation / Review System:*** This was a legacy project. We turned it into a system for Texas A&M students who have studied abroad to leave tips and experiences for future study abroad students to learn from.

### Team Members
1. Justin Hong
2. Bernard Jirka
3. Allison Kinnamore
4. Paige Raun

Setup your Heroku account to automatically sync with the master branch of your github. That's much easier than trying to push to Heroku from your Cloud9.

Good luck

## Additional Notes
The initial project was mostly just the Reviews model/controller and database table, but we have mostly abandoned the concept of Reviews. However, the Reviews stylesheet still has a lot of active styles! So that is why all the Reviews stuff hasn't been deleted yet.  
Email me at bjirka@tamu.edu if you have any questions or problems.

---

# 2022-23


### Project Description
***Experience Recommendation / Review System:*** This was a legacy (legacy project). We worked on this as part of the 2022-2023 wintermester in Singapore.

### Team Members
1. Arka Bose
2. Molly Frost
3. Anuj Ketkar
4. Abhishek More
5. Uma Sarkar
6. Sarah Sotelo <slsotelo@tamu.edu>


---

# Spring 2023


### Project Description
***Experience Recommendation / Review System:*** This was a legacy (legacy project). Graduate student team. We worked on this as a part of the Spring 2023 semester.

### Team Members
1. Blain Judkins
2. Kylee Friederichs
3. Parul Damahe
4. Tejasri Swaroop Boppana
5. Yijin Fang
6. Yu-Hsi Lin

---


# Installation Instructions

Create a [AWS Cloud9 instance](https://aws.amazon.com/cloud9/), which automatically creates an EC2 instance. We found that this was the easiest way to get this bloated legacy project up and running quickly. Cloud9 comes installed with rvm and some other cool dependencies. This is the way to go, I promise.
---

## Spring 2023 update:
After cloning the repository and having cd into it, running `./setup.sh`should complete all of the necessary installations. After this completes, proceed to the next section. 
* Note that this does assume that you are setting up with AWS Cloud9. If you are setting up locally (for reasons such as wanting to test with Selenium), the setup.sh file can be modified to use commands appropriate to your enviroment; this includes replacing `sudo yum` with `sudo apt-get` or something similar for installing.


## Alternatively, you can follow these older documentation steps: 
Complete the following steps to get your environment up and running:
```
npm install -g yarn  
rvm install ruby-3.1.3 (or rbenv install 3.1.3)
rvm use ruby-3.1.3 --default (or rbenv global 3.1.3) 
gem install rails  
sudo apt-get install postgresql postgresql-client libpq5 libpq-dev  
git clone https://github.com/TripAgvisor/TripAgvisor-GradVersion_Spring2023.git
cd TripAgvisor-GradVersion_Spring2023
gem install bundler
bundle install
yarn install
rails db:migrate
rails server
```
---
## After the installations ... (the "next" section)
- Click the address in the window that pops up in the upper right corner of the terminal window
  -- If a link does not show up after running `rails s` (same as `rails server`) or running the `setup.sh` file that should automatically run `rails server`, click "Preview" up in the ribbon (next to the "run" button) > "Preview running application". Once you see this tab open, you should press the "pop out" button in the top right (next to the browser button) to open the application in a new tab.
- You will get an error message telling you to add a line to your environment configuration. Copy the given line and paste it in /tripAgvisor/config/environments/development.rb (replace line 2 with the given line)
- In the terminal press Ctrl+c to stop the server, then type `rails server` to start it again. Refresh the page that had the error and it should be working now. (Normally, you don't have to stop and restart the server after changes, just refresh your page)
- To set up Google auth, Go to the [Google Cloud Console](https://console.developers.google.com/). You may need to create a new project. Create credentials for a new OAuth Client ID. In the consent screen, select 'External' as the user type. Fill in the remaining info (the authorized domain and all that jazz can be changed later, if you don't know it currently).
- After completing the consent screen (if you had to), create credentials for a new OAuth Client ID once again. Choose web application as the application type.
- Insert your hosted site URL (same as your config.hosts url) under the Authorized JavaScript origins. Example:
```
https://999663bc4eee4a0cb47c75a9aaa9268b.vfs.cloud9.us-east-1.amazonaws.com
AND/OR
https://tripagvisor2.herokuapp.com
```
- Insert your hosted site URL + "/auth/google_oauth2/callback" as Authorized redirect URIs. Example:
```
https://999663bc4eee4a0cb47c75a9aaa9268b.vfs.cloud9.us-east-1.amazonaws.com/auth/google_oauth2/callback
AND/OR
https://tripagvisor2.herokuapp.com/auth/google_oauth2/callback
```
- Change the admin email address in /tripAgvisor/config/application.rb so you can login as an administrator for the first time
- Create a .env file in the root directory. This ensures that your secrets are not exposed. Try not to commit this :)\
Insert the following:
```
GOOGLE_CLIENT_ID=INSERT GOOGLE CLIENT ID HERE
GOOGLE_CLIENT_SECRET=INSERT GOOGLE CLIENT SECRET HERE
```

Your app should be up and running after this. Apologies for any technical atrocities you may encounter and good luck! 

---
### Notes for viewing the application
After running `rails s` or `rails server`, you should be able to see a link popup in the terminal that allows you to open the application. If it doesn't show up, just click "Preview" up in the ribbon (next to the "run" button) > "Preview running application". Once you see this tab open, you should press the "pop out" button in the top right (next to the browser button) to open the application in a new tab.

### Additonal Notes for Testing 
The tests (especially the cucumber tests) use Selenium. But AWS Cloud 9 does not support Selenium since it does not support any kind of browsers. So we had to deploy the application on our local machine to implement and run tests. Hence, we would suggest to use the same procedure as mentioned above to deploy the app on local machine instead of AWS Cloud 9. The exact commands for installation might vary based on the operating system you are using. This will not cause any issues. 

### Storing Images in Amazon S3 for persisitency
- This website allows users to upload images and these images need to be stored somewhere. 
- The current design is such that for the development environment images are stored in the local machine and for the production environment , the images are stored in the Amazon S3 bucker. Major reason for this being persistency. 
Following are the steps to configure this :
- After you [create an AWS account](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-creating.html), [create a S3 bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-bucket-overview.html) for the production application. 
-  In the config > environments > production.rb file , the below line indicates that the storage is set to Amazon S3:
  ```
  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :amazon
  ```
 - In the config > storage.yaml file make sure have the following configured 
  ```
  amazon:
  service: S3
  access_key_id: <%= Rails.application.credentials.dig(:aws, :access_key_id) %>
  secret_access_key: <%= Rails.application.credentials.dig(:aws, :secret_access_key) %>
  region: <aws region where you create the S3 bucket>
  bucket: <name of the S3 bucket>
  ```
  Make sure you have set the right credentials in the credentials file for ruby on rails. More information regarding ediitng the crednetials can be found in this [link](https://web-crunch.com/posts/the-complete-guide-to-ruby-on-rails-encrypted-credentials). You would have to create a new [IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html) and store the credentials. (access_key_id and secret_access_key)
  
### Useful Resources
- [Connecting VSCode to Cloud9](https://medium.com/@mahantya/access-your-aws-cloud9-ec2-instance-from-vs-code-over-ssh-ee1f5ea259ff)
- [Prevent EC2 from randomizing IP on shutdown](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html#using-instance-addressing-eips-allocating)

### Notes for Images
Images are being stored in an Amazon s3 bucket.
