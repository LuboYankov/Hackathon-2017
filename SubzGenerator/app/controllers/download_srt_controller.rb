class DownloadSrtController < ApplicationController
  def download_subtitles
    file = File.open(Rails.root.join('public', 'generated_subtitles', "#{params[:filename_param]}.srt"), "rb")
    contents = file.read
    file.close

    File.delete(file.path) if File.exist?(file.path)

    send_data(contents, :filename => "#{params[:filename_param]}.srt")
  end
end
