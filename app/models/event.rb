class Event < ApplicationRecord
    belongs_to :creator, foreign_key: "user_id", class_name: "User"
    has_many :attendances
    has_many :users, through: :attendances

    # Relation pour ajouter des images
    has_one_attached :avatar
    
    validates :start_date, presence: true

    validate :date_passed
    def date_passed
      if start_date.present? && start_date < Date.today
        errors.add(:start_date, ": La date est déjà passé. Veuillez indiquer une date à venir.")
      end
    end
  
    validates :duration, presence: true
  
    validate :is_multiple_of_5
    def is_multiple_of_5
      errors.add(:duration, ": Doit être un multiple de 5") unless
          duration % 5 == 0
    end
  
    validates :title, presence: true, length: { in: 4..140 }
  
    validates :description, presence: true, length: { in: 20..1000 }
  
    validates :price,
      presence: true,
      numericality: {
        greater_than_or_equal_to: 0,
        less_than: 1000
      }
  
    validates :location, presence: true

    # Méthode pour calculer la end_date de l'event.
    def end_date
      start_date + duration * 60
    end

    # Méthode pour savoir si un user participe à un évènement
    def participate?(user)

      if self.attendances.where(user_id: user.id).count > 0
        return true
      else
        return false
      end
    end

end
