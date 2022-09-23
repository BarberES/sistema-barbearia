class AddClienteToAgendamento < ActiveRecord::Migration[7.0]
  def change
    add_reference :agendamentos, :cliente, null: false, foreign_key: true
  end
end
