class BooksController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @books = Book.all.order(:name)

      end
    
      def show
        # binding.pry
        @book = Book.find_by(id: params[:id])
      end
    
      def new
        @book = Book.new
      end
    
      def create
        @book = Book.new(book_params)
    
        if @book.save
          redirect_to @book
        else
          render :new
        end
      end
    
      def edit
        @book = Book.find_by(id: params[:id])
      end
    
      def update
        @book = Book.find_by(id: params[:id])
    
        @book.update(book_params)
    
        if @book.save
          redirect_to @book
        else
          render :edit
        end
      end
    
      private
    
      def book_params
        params.require(:book).permit(:name, :author)
      end
    
end
