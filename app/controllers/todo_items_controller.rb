class TodoItemsController < ApplicationController

    before_action :set_todo_list
    before_action :set_todo_item, except: [:create]
    before_action :authenticate_user!

    def create
        @todo_item = @todo_list.todo_items.create(todo_item_params)
        
        if @todo_item.valid?
            flash[:success] = "New Item successfully created..."
        else
            flash[:danger] = "Error creating new List item..."
        end

        redirect_to @todo_list
    end

    def destroy
        if @todo_item.destroy
            flash[:success] = "Item successfully deleted..."
        else
            flash[:danger] = "Item could not be deleted..."
        end

        redirect_to @todo_list
    end

    def toggle
        @todo_item.toggle!(:complete)
        flash[:success] = (@todo_item.complete? ? "Item completed" : "Item still incomplete")
        redirect_to @todo_list
    end

    private

    def set_todo_list
        @todo_list = TodoList.friendly.find(params[:todo_list_id])
    end

    def set_todo_item
        @todo_item = @todo_list.todo_items.find(params[:id])
    end

    def todo_item_params
        params.require(:todo_item).permit(:content, :todo_list_id, :completed)
    end
end
