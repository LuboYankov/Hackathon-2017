def convert(pathToFile, format)
	filename = pathToFile.split(".").first.to_s.split("/").last.to_s
  if not File.exists? "public/converted_data/"
    `mkdir public/converted_data/`
  end
	system("ffmpeg -i #{pathToFile} public/converted_data/#{filename}.#{format}")
	if $?.success?
		puts "Converted successfully!"
	else
		puts "Something went wrong..."
	end
  filename
end

def to_flac(pathToFile)
	convert(pathToFile, "flac")
end

def to_wav(pathToFile)
	convert(pathToFile, "wav")
end
