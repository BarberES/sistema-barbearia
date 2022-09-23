class CreateAgendamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :agendamentos do |t|
      t.datetime :initAtendimento
      t.datetime :fimAtendimento

      t.timestamps
    end
  end
end
