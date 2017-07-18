class ServiceController < ApplicationController
  before_action :require_login, only: [:letter_detail]

  def ad
    redirect_to "/service/index"
  end

  def index
    if user_signed_in?
      m = current_user.membership
      z = Array.new

      # 멤버십이 있냐
      if m
        @datetime = (DateTime.now + 9.hours).to_date


        current_user.membership.category.each do |c|
          if c
            z << c + (DateTime.now + 9.hours).to_date.to_s
          end
        end

        @is_send = z

      # 마스터냐
      elsif current_user.tag_list.include?("master")

      # 회원가입만 하고 아직 멤버십 신청을 안했냐
      else
        redirect_to "/service/register"
      end
    end
  end

  def register
  end

  def register_real
    k = Membership.new
    k.s_name = params[:s_name]
    k.s_date = params[:s_date]
    k.s_birth = params[:s_birth]
    k.s_type = params[:s_type]
    k.phone = params[:phone]
    k.category = []

    Category.all.each do |c|
      k.category << params["#{c.id}"]
    end
    k.term = params[:week]
    k.user_id = params[:user_id]
    k.save

    redirect_to "/service/index"
  end

  def letter_detail

      @letter = Letter.find(params[:id])

    # @date = params[:id]
    # l = Letter.where(l_date: params[:id])
    #   if current_user.membership.category[0]
    #
    #       a = l.where(category_id: Category.where(name:"시사").first.id).first
    #
    #   end
    #
    #   if current_user.membership.category[1]
    #
    #       b = l.where(category_id: Category.where(name:"연예").first.id).first
    #
    #   end
    #
    #   if current_user.membership.category[2]
    #
    #       c = l.where(category_id: Category.where(name:"축구").first.id).first
    #
    #   end
    #
    #   if current_user.membership.category[3]
    #
    #       d = l.where(category_id: Category.where(name:"야구").first.id).first
    #
    #   end
    #
    #   if current_user.membership.category[4]
    #
    #       e = l.where(category_id: Category.where(name:"농구").first.id).first
    #
    #   end
    #
    #   if current_user.membership.category[5]
    #
    #       f = l.where(category_id: Category.where(name:"프리미엄").first.id).first
    #
    #   end
    #
    #   @letter = [a,b,c,d,e,f]
  end

  def ask_write_real
    p = Board.new
    p.title = params[:title]
    p.content = params[:content]
    # 게시판 level0:공지사항 1:자주하는질문 2:문의하기
    p.level = 2
    p.user_id = params[:user_id]
    p.save

    redirect_to "/service/ask"
  end

  def ask_view
    @post = Board.find(params[:id])
  end

  def ask_delete
    p = Board.find(params[:id])
    p.destroy

    redirect_to "/service/ask"
  end

  def comment_write_real
    c = Comment.new
    c.content = params[:content]
    c.user_id = params[:user_id]
    c.board_id = params[:board_id]
    c.save

    redirect_to :back
  end

  def comment_delete
    c = Comment.find(params[:id])
    c.destroy

    redirect_to :back
  end

  def review_write_real
    p = Board.new
    p.title = params[:title]
    p.content = params[:content]
    # 게시판 level0:공지사항 1:자주하는질문 2:후기
    p.level = 2
    p.user_id = params[:user_id]
    p.save

    redirect_to "/service/review"
  end


  def review
    @review = Review.all
  end

  def review_view
    @post = Board.find(params[:id])
  end

  def review_delete
    p = Board.find(params[:id])
    p.destroy

    redirect_to "/service/review"
  end

  def membership_delete
    m = Membership.find(current_user.membership.id)
    m.destroy

    redirect_to "/users/edit"
  end

  def membership_update_real
      k = Membership.find(params[:id])
      k.s_name = params[:s_name]
      k.s_date = params[:s_date]
      k.s_birth = params[:s_birth]
      k.s_type = params[:s_type]
      k.phone = params[:phone]
      k.category = []

      Category.all.each do |c|
        k.category << params["#{c.id}"]
      end

      k.user_id = params[:user_id]
      k.save

      redirect_to "/service/account"
  end

  def membership_get
      u = current_user
      u.tag_list.add("MembershipOK")
      u.save

      redirect_to "/service/index"
  end
end
