class AttachmentDecorator < ApplicationDecorator
  def file_link
    h.link_to object.file.to_s, class: "btn btn-sm btn-default", target: "_blank" do
      h.content_tag(:span, "", class: "glyphicon glyphicon-file") + object.file_name
    end
  end
end
