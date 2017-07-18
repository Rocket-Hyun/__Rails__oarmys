class ManagerController < ApplicationController
    before_action :require_admin, only: [:user_all, :letter_write, :category_manage, :category_user, :letter_update, :users, :user_detail, :membership_update, :announce_update, :faq_update, :news_update, :autoscript]

    def user_all
        @user_all = User.all
        @membership_all = Membership.all
        @news_all = Letter.all
    end

    def letter_write
    end

    def letter_write_real
        l = Letter.new
        l.l_date = params[:date]
        l.category_id = Category.where(name:params[:category]).first.id
        l.title = params[:title]
        l.content = params[:content]

        uploader = MachineUploader.new
        uploader.store!(params[:pic])
        l.image_url = uploader.url
        l.image_origin = params[:pic_url]
        l.save

        redirect_to "/manager/letter_find"
    end

    def category_manage
    end

    def category_user
        @categoryname = params[:id]
        @memberships = Membership.where("category LIKE ?", "%#{params[:id]}%")
    end

    def category_add_real
        k = Category.new
        k.name = params[:name]
        k.save

        redirect_to "/manager/category_manage"
    end

    def category_delete
        k = Category.find(params[:id])
        k.destroy

        redirect_to "/manager/category_manage"
    end

    def letter_find
        if params[:l_date]
            @l_date = params[:l_date]
        else
            @l_date = (DateTime.now + 9.hours).to_date
        end
    end

    def letter_delete
        l = Letter.find(params[:id])
        l.destroy

        redirect_to :back
    end

    def letter_update
        @l = Letter.find(params[:id])
    end

    def letter_update_real
        l = Letter.find(params[:id])
        l.category_id = Category.where(name:params[:category]).first.id
        l.title = params[:title]
        l.content = params[:content]
        l.l_date = params[:date]

        unless params[:pic].nil?
          uploader = MachineUploader.new
          uploader.store!(params[:pic])
          l.image_url = uploader.url
        end

        l.image_origin = params[:pic_url]
        l.save

        redirect_to "/manager/letter_find"
    end


    def letter_send_user
        @category = Category.find(params[:id]).name
    end

    def letter_send_real
        p = Membership.find(params[:id])
        p.tag_list.add("#{params[:category]}" + (DateTime.now + 9.hours).to_date.to_s)
        p.save

        redirect_to :back
    end

    def users
    end

    def user_detail
      p = params[:id]
      if p.include?("m")
        @member = Membership.find(p[1..p.size]).user
      else
        @member = User.find(p)
      end
    end

    def membership_give
        u = User.find(params[:id])
        u.tag_list.add("MembershipOK")
        u.save

        redirect_to :back
    end

    def membership_delete
        u = User.find(params[:id])
        u.tag_list.remove("MembershipOK")
        u.save

        redirect_to :back
    end

    def membership_destroy
        k = Membership.find(params[:id])
        k.destroy
        redirect_to "/manager/users"
    end

    def user_destroy
        k = User.find(params[:id])
        k.destroy
        redirect_to "/manager/users"
    end

    def membership_update
        @user = User.find(params[:id])
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

        redirect_to "/manager/user_detail/m#{params[:id]}"
    end

    def announce_write_real
        p = Board.new
        p.title = params[:title]
        p.content = params[:content]
        # 게시판 level0:공지사항 1:자주하는질문 2:문의하기
        p.level = 0
        p.user_id = params[:user_id]
        p.save

        redirect_to "/manager/board"
    end

    def announce_delete
        p = Board.find(params[:id])
        p.destroy

        redirect_to "/manager/board"
    end

    def announce_update
        @announce = Board.find(params[:id])
    end

    def announce_update_real
        p = Board.find(params[:id])
        p.title = params[:title]
        p.content = params[:content]
        # 게시판 level0:공지사항 1:자주하는질문 2:문의하기
        p.level = 0
        p.user_id = params[:user_id]
        p.save

        redirect_to "/manager/board"
    end

    def faq_write_real
        p = Board.new
        p.title = params[:title]
        p.content = params[:content]
        # 게시판 level0:공지사항 1:자주하는질문 2:문의하기
        p.level = 1
        p.user_id = params[:user_id]
        p.save

        redirect_to "/manager/board"
    end

    def faq_delete
        p = Board.find(params[:id])
        p.destroy

        redirect_to "/manager/board"
    end

    def faq_update
        @faq = Board.find(params[:id])
    end

    def faq_update_real
        p = Board.find(params[:id])
        p.title = params[:title]
        p.content = params[:content]
        # 게시판 level0:공지사항 1:자주하는질문 2:문의하기
        p.level = 1
        p.user_id = params[:user_id]
        p.save

        redirect_to "/manager/board"
    end

    def news_write_real
        p = Board.new
        p.title = params[:title]
        p.content = params[:content]
        # 게시판 level0:공지사항 1:자주하는질문 2:문의하기
        p.level = 3
        p.user_id = params[:user_id]
        p.save

        redirect_to "/manager/board"
    end

    def news_delete
        p = Board.find(params[:id])
        p.destroy

        redirect_to "/manager/board"
    end

    def news_update
        @faq = Board.find(params[:id])
    end

    def news_update_real
        p = Board.find(params[:id])
        p.title = params[:title]
        p.content = params[:content]
        # 게시판 level0:공지사항 1:자주하는질문 2:문의하기 3:전송된 핫 이슈
        p.level = 3
        p.user_id = params[:user_id]
        p.save

        redirect_to "/manager/board"
    end


end
