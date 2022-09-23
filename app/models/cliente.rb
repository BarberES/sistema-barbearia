class Cliente < ApplicationRecord
  has_many :agendamentos, :dependent => :destroy
end
