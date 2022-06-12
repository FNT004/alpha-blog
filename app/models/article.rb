class Article < ActiveRecord::Base
    
    validates :title, presence: true, length: { minimum: 3, maximum:150 }
    has_rich_text :description
    
    belongs_to :user
    
end