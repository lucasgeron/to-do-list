class TasksController < ApplicationController

    def index
        @tasks = Task.all
        @task = Task.new
      end


      def create
        @task = Task.new(task_params)
    
        respond_to do |format|
          if @task.save
            format.html { redirect_to tasks_url, notice: "Tarefa criada com sucesso!"}
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
      end


    #   
      def toggle
        @task = Task.find(params[:id])
        @task.update(completed: params[:completed])
      
        render json: { message: "Toggle update!" }
      end



      def edit
        @task = Task.find(params[:id])
      end

      def update
        @task = Task.find(params[:id])
        respond_to do |format|
          if @task.update(task_params)
            format.html { redirect_to tasks_url, notice: "Tarefa atualizada com sucesso!" }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
      end
    
      def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_url, notice: "Tarefa excluída com sucesso!."
      end










      










 private

  def task_params
    params.require(:task).permit(:description)
  end

end
