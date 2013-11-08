module ContributorsHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(contributor, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(contributor.email.downcase)
    size = options[:size]
    default = 'blank'
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
    image_tag(gravatar_url, alt: contributor.short_name, class: "gravatar")
  end
end
