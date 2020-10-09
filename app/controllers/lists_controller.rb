class ListsController < ApplicationController
    before_action :set_list, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]

    def index
        @lists = List.All
        render json: @lists
    end

    def create
        @list = List.new(list_params)
        if @list.save
            render json: @list
        else
            render json: @list.errors, status: :unprocessable_entity
        end
    end

    def update
        if @list.update(list_params)
            render json: @list
        else
            render json: @list.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @list.destroy
    end


    private

    def set_list
        @list = List.find(params[:id])
    end

    def list_params
        params.require(:list).permit(:title)
    end

end
