class ListsController < ApplicationController
  def index
    # get all the lists
    @lists = List.all
    @list = List.new # define new list for form rendered on the List index
  end

  def show
    # get a list
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      @list = List.all
        # render :new, status: :unprocessable_entity # reroute to new (uncomment for rspec)
        render :index, status: :unprocessable_entity # route to index
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
