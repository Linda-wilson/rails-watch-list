class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show

    @list = List.find(params[:id])
    #raise
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
end

private
def list_params
  params.require(:list).permit(:name)
end
