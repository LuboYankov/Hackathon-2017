require_relative "./video_services/convert_video.rb"
require_relative "./video_services/audio_to_text.rb"

class FileUploadController < ApplicationController
	before_action :authenticate_user!
	def index
	end

	def new
	end

	def create
		name = params[:upload][:file].original_filename
		directory = "public/data"
		path = File.join(directory, name)
		if not File.exists? directory
		  `mkdir "#{directory}"`
		end
		File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
		filename = to_flac(path)
		json_data_to_srt(filename, get_json_data("public/converted_data/#{filename}.flac"), params[:upload][:lang])
		File.delete("public/converted_data/#{filename}.flac") if File.exist?("public/converted_data/#{filename}.flac")
		File.delete("public/data/#{filename}.mp4") if File.exist?("public/data/#{filename}.mp4")
		redirect_to :controller => :download_srt, :action => 'download_subtitles', :filename_param => filename
	end
end
