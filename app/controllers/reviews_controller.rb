class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(reviews_params)
    @review.book_id = @book.id
    @review.user_id = current_user.id
    if @review.save!
      redirect_to book_path(@book)
    else
      redirect_to books_path
    end 
  end 
  
  private
  
  def reviews_params
    params.require(:review).permit(:impression)
  end
end
