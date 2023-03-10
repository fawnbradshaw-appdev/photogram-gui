class PhotosController <ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render ({ :template => "photo_templates/index.html.erb"})
  end

  def show

    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

    render ({ :template => "photo_templates/show.html.erb"})
  end

  def delete
    the_id = params.fetch("delete_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.at(0)
    the_photo.destroy

    #render ({ :template => "photo_templates/delete.html.erb"})
    redirect_to("/photos")
  end

  def create

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    new_photo = Photo.new

    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id

    new_photo.save

    #render ({ :template => "photo_templates/create.html.erb"})
    redirect_to("/photos/" + new_photo.id.to_s)
  end

  def edit

    the_id = params.fetch("edit_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    #render ({ :template => "photo_templates/edit.html.erb"})

    next_url = "/photos/" + the_photo.id.to_s
    redirect_to(next_url)
  end

  def comment

    the_id = params.fetch("photo_id")

    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)

    input_id = params.fetch("query_id")
    input_owner_id = params.fetch("query_owner_id")
    input_comment = params.fetch("query_comment")

    new_comment = Comment.new

    new_comment.photo_id = input_id
    new_comment.author_id = input_owner_id
    new_comment.body = input_comment

    new_comment.save

    #render ({ :template => "photo_templates/comment.html.erb"})

    next_url = "/photos/" + the_photo.id.to_s
    redirect_to(next_url)

  end
end
