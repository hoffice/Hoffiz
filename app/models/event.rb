class Event < ActiveRecord::Base
	belongs_to :space
	has_many :bookings

	has_attached_file :header_img, :styles => { :medium => "600x400>", :thumb => "450x300>" }, :default_url => "/images/:style/missing.png"

	validates_attachment_content_type :header_img, :content_type => /\Aimage\/.*\Z/

	def slug
      title.parameterize
  	end

  	def to_param
      slug 
  	end
end
