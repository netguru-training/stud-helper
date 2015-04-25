class SubjectDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{name} (#{short_name})"
  end

end
