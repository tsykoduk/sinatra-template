# example model file
class User < ActiveRecord::Base  

  validates_presence_of :name, :on => :save, :message => "Name must not be blank"
  

end