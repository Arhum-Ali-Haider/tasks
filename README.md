# straiv
This repo contains tasks provided by STRAIV

This documents contains information about configuration and have detailed processes how the tasks will be able execute. Details are given under each task heading.


#1.Task (XML Handling)
  ###### lib/reader/xml_reader.rb        you can run this command to get desired result "ruby lib/reader/xml_reader.rb"
  

#2.Task (Count array and sort)
######  It is implemented in tasks_controller. you can run "rails server" goto index page ,there you can see button which would trigger its execution and show result on that page.

#3.Task (Handle positions)
  ######you can see the implementation of this task at app/models/navigation.rb

#4.Task (Base64 to Image)
  ###### It is implemented in tasks_controller. you can run "rails server" goto index page ,there you can see button which would trigger its execution and then    goto "tmp" directory where can see image. I already ran this and generated image there.
   
#5.Task (Delete duplicates)
 ###### I have created a model "User" to perform this task. You can see query written there and i have mentioned optimized solution here as well:
 #### User.where('id NOT IN (?)',User.group(:name).having("MAX(created_at)").ids).destroy_all
