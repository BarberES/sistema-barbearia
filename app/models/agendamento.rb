class Agendamento < ApplicationRecord
  belongs_to :barbeiro
  belongs_to :cliente
end
