class AddServiceToAgendamento < ActiveRecord::Migration[7.0]
  def change
    add_reference :agendamentos, :service, null: false, foreign_key: true
  end
end
