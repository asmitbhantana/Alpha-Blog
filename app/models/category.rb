class Category < ActiveRecord::Base
 # validates :name, presence :true, length: {minimum:3, maximum:25}
 # validates_uniqueness_of :name
  has_many :article_categories
  has_many :articles, through: :article_categories
  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end
