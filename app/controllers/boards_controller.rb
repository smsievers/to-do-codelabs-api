class BoardsController < ApplicationController
    before_action :set_board, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]

    def index
        @boards = Boards.all 
        render json: { boards: @boards }
    end

    def show
        render json:  @board, :include => { :lists=> {include: [:cards]} }
    end

    def create 
        @board = Board.new(board_params)
        if @board.save
            render json: @board, status: :created
        else
            render json: @board.errors, status: :unprocessable_entity
        end
    end

    def update 
        if @board.update(board_params)
            render json: @board
        else
            render json: @board.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @board.destroy
    end

    private 
    def set_board
        @board = Board.find(params[:id])
    end
    
    def board_params
        params.require(:board).permit(:title)
    end
end
