class AddBarbeiroToAgendamento < ActiveRecord::Migration[7.0]
  def change
    add_reference :agendamentos, :barbeiro, null: false, foreign_key: true
  end
end
