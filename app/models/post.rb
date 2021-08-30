class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate  :title_must_be_clickbaity

    def title_must_be_clickbaity
        ["Won't Believe", "Secret", "Top [number]", "Guess"].each do |buzzword|
            return if title && title.include?(buzzword)
        end
        errors.add(:title, 'must be clickbaity')
    end

end
