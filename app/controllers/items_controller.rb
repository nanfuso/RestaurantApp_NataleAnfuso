class ItemsController < ApplicationController
   before_action :authenticate_admin!, except: [:index, :show]

    def index
        @items = Item.all
    end

    def new
    end

    def create
        @item = Item.create!(
                            name: params[:name],
                            description: params[:description],
                            price: params[:price],
                            category: params[:category]
                            )

        if @item.save
            flash[:success] = "Menu Item Successfully Created!"
            redirect_to "/items/#{@item.id}"
        else
            flash[:warning] = "Oops, something went wrong"
            render 'new.html.erb'
        end
    end

    def show
        @item = Item.find(params[:id])
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])

        @item.assign_attributes(
                                name: params[:name],
                                description: params[:description],
                                price: params[:price],
                                category: params[:category]
                                )

        if @item.save
            flash[:success] = "Menu Item Updated"
            redirect_to "/items/#{@item.id}"
        else
            flash[:warning] = "Oops, something went wrong"
            render 'edit.html.erb'
        end
    end

    def destroy
        item = Item.find(params[:id])
        item.destroy
        flash[:danger] = "Menu Item Destroyed"
        redirect_to '/'
    end
end
