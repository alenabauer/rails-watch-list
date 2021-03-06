class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    find_list
  end

  def create
    find_list
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = @list.id
    if @bookmark.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def show
    find_list
    @bookmark = Bookmark.find(params[:id])
    @movie = Movie.find(@bookmark.movie_id)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(params[:list_id])
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
