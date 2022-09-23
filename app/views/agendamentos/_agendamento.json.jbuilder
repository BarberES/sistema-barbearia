json.extract! agendamento, :id, :initAtendimento, :fimAtendimento, :created_at, :updated_at
json.url agendamento_url(agendamento, format: :json)
