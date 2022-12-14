class AgendamentosController < ApplicationController
  before_action :set_agendamento, only: %i[ show edit update destroy ]

  # GET /agendamentos or /agendamentos.json
  def index
    @agendamentos = Agendamento.all
  end

  # GET /agendamentos/1 or /agendamentos/1.json
  def show
  end

  # GET /agendamentos/new
  def new
    @agendamento = Agendamento.new
  end

  # GET /agendamentos/1/edit
  def edit
  end

  # POST /agendamentos or /agendamentos.json
  def create
    @barbeiro = Barbeiro.find(agendamento_params[:barbeiro_id])
    @cliente = Cliente.find(params[:cliente_id])
    @agendamento = @cliente.agendamentos.create(agendamento_params)
    @agendamento.fimAtendimento = @agendamento.inicioAtendimento + 30.minutes
    @cliente.agendamentos << @agendamento
    @barbeiro.agendamentos << @agendamento
    redirect_to cliente_path(@cliente)
  end

  # PATCH/PUT /agendamentos/1 or /agendamentos/1.json
  def update
    respond_to do |format|
      if @agendamento.update(agendamento_params)
        format.html { redirect_to agendamento_url(@agendamento), notice: "Agendamento was successfully updated." }
        format.json { render :show, status: :ok, location: @agendamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agendamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendamentos/1 or /agendamentos/1.json
  def destroy
    @agendamento.destroy

    respond_to do |format|
      format.html { redirect_to agendamentos_url, notice: "Agendamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agendamento
      @agendamento = Agendamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agendamento_params
      params.require(:agendamento).permit(:inicioAtendimento, :fimAtendimento, :cliente_id, :barbeiro_id, :service_id)
    end
end
