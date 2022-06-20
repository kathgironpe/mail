# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
class Store < ApplicationRecord
  has_many :subscribers

  validates :email, presence: true
  validates :name, presence: true
end
