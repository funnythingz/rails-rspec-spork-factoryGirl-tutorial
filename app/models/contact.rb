class Contact < ActiveRecord::Base

  has_many :phones

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true

  def fullname
    [firstname, lastname].join(' ')
  end
end
