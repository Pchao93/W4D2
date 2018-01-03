# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: ['APPROVED', 'DENIED', 'PENDING']
  validates :cat_id, :start_date, :end_date, presence: true
  validate :does_not_overlap_approved_requests

  belongs_to :kat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Kat

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: self.cat_id)
      .where('? BETWEEN start_date AND end_date OR ? BETWEEN start_date AND end_date OR (? < start_date AND ? > end_date)', self.start_date, self.end_date, self.start_date, self.end_date)
  end

  def overlapping_approved_requests
    overlapping_requests
      .where(status: 'APPROVED')
  end

  def does_not_overlap_approved_requests
    if overlapping_approved_requests.any? do |request|
      CatRentalRequest.exists?(request.id)
    end
      errors.add(:time_period, 'overlaps with an approved request')
    end
  end
end
