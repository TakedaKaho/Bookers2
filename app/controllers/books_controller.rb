class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="You have created book successfully."
    redirect_to book_path(@book.id)
    else
      render :index
    end
  end 


  def index
    respond_to do |format|
      format.html do
        @book = Book.new # 新しい Book オブジェクトを追加
        if params[:latest]
          @books = Book.latest
        elsif params[:old]
          @books = Book.old
        else
          @books = Book.all
        end
      end
      format.json do
        @books = Book.all
        #render json: { data: { items: @books.as_json(only: [:title, :opinion, :address, :zipcode, :latitude, :longitude]) } }
      end
    end
  end



  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end 

  def edit
    is_matching_login_user
    @book = Book.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
    redirect_to book_path(@book.id)
    else
      render :edit
    end
  end 
  
  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path
  end
  
  
  
 private

  def book_params
   params.require(:book).permit(:title, :body, :user_id, :address)
  end
  
def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
  end
end
