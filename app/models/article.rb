class Article < ActiveRecord::Base
    
    validates :title, presence: true, length: { minimum: 3, maximum:150 }
    validates :description, presence: true, length: {minimum:10, maximum:5000}
    belongs_to :user
    has_rich_text :content
end