module JobsHelper
  def render_is_hidden_status(job)
    if job.is_hidden
      content_tag(:i, '', class:"fa fa-lock fa-lg")
    else
      content_tag(:i, '', class:"fa fa-globe fa-lg")
    end
  end
end
