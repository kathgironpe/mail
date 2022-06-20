# == Schema Information
#
# Table name: mailings
#
#  id         :bigint           not null, primary key
#  from       :string
#  html       :text
#  subject    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :integer
#
# Indexes
#
#  index_mailings_on_store_id  (store_id)
#
class Mailing < ApplicationRecord
  belongs_to :store

  validates :from, presence: true
  validates :html, presence: true
  validates :subject, presence: true

  def self.get_mailings(id)
    Mailing.includes(:store).where(id: id).try(:first)
  end

  def subscribers
    store.subscribers
  end
end
