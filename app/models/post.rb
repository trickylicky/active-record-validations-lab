class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validate :must_be_clickbaity

    def must_be_clickbaity
        if !(["Won't Believe","Secret","Top [number]","Guess"].any?{|word|"#{title}".include?(word)})
            errors.add(:title, "is not clickbait")
        end
      end

end
