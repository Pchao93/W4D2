# == Schema Information
#
# Table name: kats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Kat < ApplicationRecord
  COLORS = ['red', 'green', 'blue', 'yellow', 'orange', 'violet']
  validates :birth_date, :name, :description, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: ['M', 'F']

  def age
    ((Date.today - self.birth_date)/365.0).round
  end

  def colors
    COLORS
  end

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
end
