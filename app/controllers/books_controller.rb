class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  # def new
  #   @book = Book.new
  # end

  def create
   	@book = Book.new(book_params)
   	if @book.save
   	#保存できた場合
   	redirect_to book_path(@book)
   	flash[:notice] = "Book was successfully created."
     else
   	#保存できなかった場合
     @books = Book.all
   	render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  	@book = Book.find_by(id: params[:id])
  	if @book.update(book_params)
  	#保存できた場合
    redirect_to book_path(@book)
    flash[:notice] = "Book was successfully updated."
    else
    #保存できなかった場合
    render :edit
    end
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to ('/books')
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
