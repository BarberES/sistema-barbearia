class Agendamento < ApplicationRecord
  belongs_to :barbeiro
  belongs_to :cliente

  validates :cliente_id, :barbeiro_id, :initAtendimento, presence: true
  validates :initAtendimento, uniqueness: true

  validate :horarioDeAbrir?, :horarioDeAlmoco?, :horarioQueFecha?,

  def horarioDeAbrir?
    if !initAtendimento.nil? && initAtendimento.hour < 8
      errors.add :initAtendimento, 'Horario indisponivel, barbearia abre as 8hrs'
    end
  end

  def horarioDeAlmoco?
    if !initAtendimento.nil? && initAtendimento.hour >=12 && initAtendimento.hour < 13
      errors.add :initAtendimento, 'Horario de almoço das 12hrs as 13hrs'
    end
  end

  def horarioQueFecha?
    if !initAtendimento.nil? && initAtendimento.hour >= 18
      errors.add :initAtendimento, 'Barbearia fechada as 18hrs'
    end
  end
end
