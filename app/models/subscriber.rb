# == Schema Information
#
# Table name: subscribers
#
#  email      :string
#  first_name :string
#  last_name  :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :integer
#
# Indexes
#
#  index_subscribers_on_store_id  (store_id)
#  index_subscribers_on_uid       (uid)
#
class Subscriber < ApplicationRecord
  belongs_to :store

  validates :uid, presence: true
  validates :store_id, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def last_order_amount
    order = Order.where(subscriber_uid: uid).order('created_at DESC')

    order.last.try(:total).try(:to_i)
  end
end
