class TodoList < ApplicationRecord

    extend FriendlyId
    friendly_id :title, use: :slugged

    # Db columns
    # title: string
    # description: text
    # user_id: integer (references 'user' model)
    # slug: string



    # Validations
    validates :title, length: { minimum: 3, message: "Must be minimum of length 3 characters" }



    # Associations

    has_many :todo_items, dependent: :destroy
    belongs_to :user
end
