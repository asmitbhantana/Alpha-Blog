class Article < ActiveRecord::Base
	validates :title, presence: true,uniqueness: {case_sensitive: false},length: {minimum:10, maximum:200}
	validates :description, presence: true ,uniqueness: {case_sensitive: false},length: {minimum:10, maximum: 30000}
end 
