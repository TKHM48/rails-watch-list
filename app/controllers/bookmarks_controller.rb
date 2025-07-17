class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id]) # define the list
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(:list_id) # define the list
    @bookmark = Bookmark.new(bookmark_params) # create a new bookmark with params
    @bookmark.list = @list # attach the lidt to the bookmark
      if @bookmark.save # if save, redirect to the show
        redirect_to list_path(@list)
      else
        redirect_to list_path(@list), status: :unprocessable_entity #redirect to list show
        # render :new, status: unprocessable_entity # if not save, render new (uncomment for rake test)
      end
  end

  def destroy
    @bookmark = Bookmar.find(params[:id]) # get the bookmark
    @bookmark.destroy # destroy the bookmark
    redirect_to list_path(@bookmark.list), status: :see_other #redirect to the bookmark's list
  end

  private
  def bookmark_params # string params
    params.require(:bookmark).permit(:move_id, :comment)
  end
end
