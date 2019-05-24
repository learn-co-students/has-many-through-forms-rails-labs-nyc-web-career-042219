class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :comments

  def categories_attributes=(category_attributes)
  	category_attributes.values.each do |category_attribute|
  		category = Category.find_or_create_by(category_attribute)
  		self.categories << category
  	end
  end

  # def categories_attributes
  #   self.ca
  # end

  # def comment_content=(comment_content)
  #   comment_content.values.each do |content|
  #     con


end
