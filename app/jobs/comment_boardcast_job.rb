class CommentBoardcastJob < ApplicationJob
    queue_as :default

    def perform(comment)
        ActionCable.server.boardcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
    end

    private

    def render_comment(comment)
        CommentsConrtoller.render partial: 'comments/comment', locals: { comment: comment }
    end
end