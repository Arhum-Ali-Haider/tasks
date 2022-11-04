class TasksController < ApplicationController
  require "base64"

  def index
  end

  #task 4: Convert the attached Base64 to an Image and save it in the Rails tmp directory.
  def convert_base64_to_image
    
    file_data = File.read(Rails.root.join('tmp/base64.txt'))
    filetype = /(png|jpg|jpeg|gif|PNG|JPG|JPEG|GIF)/.match(file_data[0,16])[0]
    filename = "base64_image"
    path = Rails.root.join('tmp')
    # write file
    new_file = "#{path}/#{filename}" << '.' << filetype #naming image file
    File.open(new_file, 'wb') do|f|
      f.write(Base64.decode64(file_data.split(",")[1])) #creating image
    end
    redirect_to root_path,  flash: {notice: "image created"}
  end

  #task 2: Count matching objects in the array and create a sorted descending (Key, Value) hash.
  def manipulate_array_and_convert_to_hash #task 2
    objects = ["bed", "pillow", "bed", "pillow", "table", "bed", "pillow", "door",   
    "light", "minibar", "light", "chair", "chair", "light", "light", "hairdryer", 
    "soap"]

    new_hash = {}
    objects.uniq.map {|obj| new_hash[:"#{obj}"] = objects.count(obj)}  #iterating through uniq set of array and creating a hash where key is the object itself
                                                                        #and value is the frequency of the object
    redirect_to root_path,  flash: {notice: new_hash.sort_by {|_key, value| value}.reverse.to_h} #sorting array in descending order by its frequency
  end

end
