class Barbeiro < ApplicationRecord

  validates :nome, presence: true, numericality: false, length: {in: 5..40},
            format: { with: /\A[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+\z/}

  validate :cpf_valido
  validate :data_nascimento_valida
  validates :telefone, presence: true, numericality: true, length: { is: 11 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def data_nascimento_valida
    if data_nascimento.present? && data_nascimento > Date.today
      errors.add(:data, "não pode ser no futuro")
    end
  end

  def cpf_valido
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, "formato ou numero errado")
    end
  end
end
