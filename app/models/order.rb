class Order < ApplicationRecord
  acts_as_paranoid
  enum status: {Pending: 0, Shipping: 1, Delivered: 2, Canceled: 3,
                Rejected: 4}

  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  belongs_to :user

  delegate :name, to: :user

  scope :oldest, ->{order created_at: :asc}

  scope :this_month, (lambda do
    where(created_at:
      DateTime.now.beginning_of_month..DateTime.now.end_of_month)
  end)
end
