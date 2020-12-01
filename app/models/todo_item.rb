class TodoItem < ApplicationRecord

  # Db columns
  # content: string
  # complete: boolean
  # todo_list_id: integer (references 'todo_list' model)
  


  # Validations
  validates :content, length: { minimum: 3, message: "Must be minimum of length 3 characters" }



  # Associations
  belongs_to :todo_list
end
