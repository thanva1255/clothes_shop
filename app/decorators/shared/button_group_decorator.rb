class Shared::ButtonGroupDecorator < Draper::Decorator
  delegate_all

  def decorated
    query_param_key, buttons = object

    Shared::ButtonGroupDecorator.new(
      query_param_key:,
      buttons:
    )
  end
end

class Shared::ButtonDecorator < Draper::Decorator
  delegate_all

  def decorated
    label, path, value = object

    Shared::ButtonGroupDecorator.new(
      label:,
      path:,
      value:
    )
  end
end
