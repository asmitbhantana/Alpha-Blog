class Article < ActiveRecord::Base
	belongs_to :user
	has_many  :article_categories
	has_many  :categories, through: :article_categories
	has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumb: "150x150" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	validates :title, presence: true,uniqueness: {case_sensitive: false},length: {minimum:10, maximum:200}
	validates :description, presence: true ,uniqueness: {case_sensitive: false},length: {minimum:50, maximum:30000}
	validates :user_id, presence: true 
end 
