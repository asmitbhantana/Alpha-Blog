class Article < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true,uniqueness: {case_sensitive: false},length: {minimum:10, maximum:200}
	validates :description, presence: true ,uniqueness: {case_sensitive: false},length: {minimum:50, maximum:30000}
	validates :user_id, presence: true 
end 
