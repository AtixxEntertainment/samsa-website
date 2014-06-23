class ProductDecorator < ApplicationDecorator
  def image
    h.image_tag image_url, class: "product-image"
  end

  def tiny_image
    h.image_tag image_url, class: "product-image-tiny"
  end

  def summary
    GitHub::Markdown.render(object.summary.to_s).html_safe
  end
end
