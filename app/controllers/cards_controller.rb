class CardsController < ApplicationController
    before_action :set_card, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]

    def index
        @cards = Card.all
        render json: @cards
    end

    def create 
        @card = Card.new(card_params)
            if @card.save
                render json: @card, status: :created
            else
                render json: @card.errors, status: :unprocessable_entity
            end
        end
    end

    def update 
        if @card.update(card_params)\
            render json: @card
        else
            render json: @card.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @card.destroy
    end

    private 

    def set_card
        @card = Card.find(params[:id])
    end
    
    def card_params
        params.require(:card).permit(:title, :body, :priority)
    end
    
end
