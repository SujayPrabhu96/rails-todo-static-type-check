# typed: true

class Todo < ApplicationRecord
  extend T::Sig

  validates :title, presence: true

  sig { returns(T::Boolean) }
  def done?
    T.must(completed)
  end
end
