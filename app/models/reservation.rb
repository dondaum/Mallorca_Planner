class Reservation < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate  :end_after_start

  def end_after_start
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
   end

   def start_time
        self.start_date
   end

   def end_time
        self.end_date
   end

end
