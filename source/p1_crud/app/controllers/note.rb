get '/new_note' do
  	current_user	
	erb :_new_note
end


#get for EDIT, from the correlating href
get '/note/:note_id/edit' do
  current_user
  @note = Note.find_by_id(params[:note_id])

  erb :edit_note
end

#get for DELETE, from the correlating href
get '/note/:note_id/delete' do
  current_user
  @note = Note.find_by_id(params[:note_id])

  if request.xhr?
    erb :_delete_note, layout: false
  else
    erb :_delete_note
  end
end


# POST ---------------------------------
 

post '/new_note' do
	@note = Note.create(user_id: session[:user_id], title: params[:title], content: params[:content])
	
	redirect '/homepage'
end

put '/note/:note_id/edit' do
  @note_to_edit = Note.find_by_id(params[:note_id])
  @note_to_edit.update_attributes(title: params[:edit_title], content: params[:edit_content])
  # puts params[:title]
  # puts params[:content].inspect #nil?

  redirect '/homepage'
end

delete '/notes/:note_id/delete' do
  @note_to_delete = Note.find_by_id(params[:note_id])
  @note_to_delete.destroy

  redirect '/homepage'
 

end



