class Event < ActiveRecord::Base

	validates :title, presence: true
	validates :description, presence: true, uniqueness: true
	validates :event_date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :city, presence: true
	validates :near, presence: true
	validates :seats, presence: true


	paginates_per 16

	before_create :assign_slug
	belongs_to :user
	has_many :bookings

	has_attached_file :header_img, :styles => { :medium => "600x400>", :thumb => "450x300>" }, :default_url => "/images/:style/missing.png"

	validates_attachment_content_type :header_img, :content_type => /\Aimage\/.*\Z/

	validates_with AttachmentSizeValidator, :attributes => :header_img, :less_than => 2.megabytes

	def assign_slug
      self.slug = title.parameterize
  	end

  	def to_param
      slug 
  	end
end
