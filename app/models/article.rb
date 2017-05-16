class Article < ActiveRecord::Base
	belongs_to :user
	has_many  :article_categories
	has_many  :categories, through: :article_categories
	validates :title, presence: true,uniqueness: {case_sensitive: false},length: {minimum:10, maximum:200}
	validates :description, presence: true ,uniqueness: {case_sensitive: false},length: {minimum:10, maximum: 30000}
	validates :user_id, presence: true 
end 
