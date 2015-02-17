class Event < ActiveRecord::Base

	paginates_per 16

	before_save :assign_slug
	before_save :lowercase_city
	belongs_to :user

	has_attached_file :header_img, :styles => { :medium => "600x400>", :thumb => "450x300>" }, :default_url => "/images/:style/missing.png"

	validates_attachment_content_type :header_img, :content_type => /\Aimage\/.*\Z/

	validates_with AttachmentSizeValidator, :attributes => :header_img, :less_than => 2.megabytes

	def assign_slug
      self.slug = self.title.parameterize
  	end

  	def lowercase_city
      self.city = self.city.downcase
  	end

  	def to_param
      slug 
  	end
end
