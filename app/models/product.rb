class Product < ActiveRecord::Base
			 belongs_to :category
			  belongs_to :sub_category
	 has_many :images , :dependent => :destroy
accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if=>:all_blank
has_many :images, :as => :imagable
end
