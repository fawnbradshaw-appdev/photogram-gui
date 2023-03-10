Rails.application.routes.draw do
    get("/", { :controller => "users", :action => "index" })

    get("/users", { :controller => "users", :action => "index"})
    get("/users/:path_username", { :controller => "users", :action => "show" })

    get("/add_user", { :controller => "users", :action => "create" })
    get("/update_user/:edit_id", { :controller => "users", :action => "edit" })

    get("/photos", { :controller => "photos", :action => "index"})
    get("/photos/:path_id", { :controller => "photos", :action => "show" })


    get("/delete_photo/:delete_id", { :controller => "photos", :action => "delete" })
    get("/insert_photo", { :controller => "photos", :action => "create" })
    get("/update_photo/:edit_id", { :controller => "photos", :action => "edit" })
    get("/add_comment/:photo_id", { :controller => "photos", :action => "comment" })
end
