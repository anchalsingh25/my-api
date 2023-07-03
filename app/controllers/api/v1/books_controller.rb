module Api
  module V1 
    class BooksController < ApplicationController

      def index
        render json: Book.all
      end

      def create
        book = Book.create(book_params)
        if book
          render json: book, status: 201
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      def show
        book = Book.find(params[:id])
        if book
          render json: book, status: 200
        else
          render json: {error: "Product not found"}
        end
      end

      # def update
      #   book = Book.find(params[:id])
      #   book.update!(book_params)
      # end

      def destroy
        Book.find(params[:id]).destroy
        head :no_content   
      end

      private

      def book_params
        params.require(:book).permit(:title, :author)
      end
    end
  end
end