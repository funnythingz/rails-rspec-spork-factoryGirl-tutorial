class Phone < ActiveRecord::Base
  belongs_to :contact

  validate :phone, uniqueness: {scope: :contact_id}
end
