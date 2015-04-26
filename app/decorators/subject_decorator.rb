class SubjectDecorator < BaseDecorator
  def full_name
    "#{name} (#{short_name})"
  end
end
