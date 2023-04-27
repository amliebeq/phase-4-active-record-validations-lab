class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    validate :must_have_clickbait

    def must_have_clickbait
        if title != nil && title.exclude?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
           errors.add(:title, "That is not clickbaity enough!") 
        end
    end
end
