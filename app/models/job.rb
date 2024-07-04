class Job < ApplicationRecord
  enum status: { active: 0, inactive: 1 }
  belongs_to :recruiter

  scope :search, ->(query) {
    scope :search, ->(query) {
      where("title LIKE :query OR description LIKE :query OR skill LIKE :query OR id = :id_query",
            query: "%#{query}%", id_query: query.to_i)
    }
  }
end
