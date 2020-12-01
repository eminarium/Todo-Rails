class TodoList < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_many :todo_items, dependent: :destroy
    belongs_to :user
end
