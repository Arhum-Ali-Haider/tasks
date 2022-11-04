class Navigation < ApplicationRecord
  after_create :add_position
  after_destroy :re_arrange_positions

  #task 3: When an item was added, it should be placed at the bottom of the list (highest position number)
  def add_position
    self.position = Navigation.count == 1 ?  1 : Navigation.count 
    self.save
  end

  #task 3: When “Events” will be destroyed, the positions should now be 1-5 Check-in is 5
  def re_arrange_positions
    unless Navigation.count == self.position
      #get navigations with position higher than the deleted one
      Navigation.where("position > ?",self.position).each do |nav|
        nav.position = nav.position - 1
        nav.save
      end
    end
  end

end
