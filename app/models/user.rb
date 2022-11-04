class User < ApplicationRecord
  def self.remove_duplicates
    #first try
    # records_that_needs_to_be_retained = []
    # User.group(:name).select('id,max(:created_at)').each {|v| records_that_needs_to_be_retained << v.id}
    # duplicate_records = User.ids - records_that_needs_to_be_retained
    # User.where(id: duplicate_records).destroy_all

    #second try
    # User.where('id NOT IN (?)',User.group(:name).having("MAX(created_at)").ids).destroy_all

  end
  
  #User.remove_duplicates call method in console to remove duplicates
end