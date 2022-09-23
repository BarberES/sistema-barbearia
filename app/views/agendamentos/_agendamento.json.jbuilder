json.extract! agendamento, :id, :data, :initAtendimento, :fimAtendimento, :created_at, :updated_at
json.url agendamento_url(agendamento, format: :json)
