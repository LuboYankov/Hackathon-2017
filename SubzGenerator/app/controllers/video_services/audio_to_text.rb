require 'json'
def get_json_data(pathToFile)
	response = `curl -X POST -u 6b832e7b-a64a-4031-a7f9-118b551bb1d1:oLMdskNywb3T https://stream.watsonplatform.net/speech-to-text/api/v1/recognize?timestamps=true --header \"Content-Type: audio/flac\" --data-binary @#{pathToFile}`
	JSON.parse(response)
end

def json_data_to_srt(filename, json_data)
	if not File.exists? "public/generated_subtitles/"
    `mkdir public/generated_subtitles/`
  end
	file_exist?("public/generated_subtitles/#{filename}.srt")
	counter = 0
	snippets = json_data['results']
	snippets.each do |snippet|
		counter += 1
		write_to_file(filename, counter, snippet)
	end
end

def convert_time(seconds)
	Time.at(seconds).utc.strftime("%H:%M:%S")
end

def file_exist?(file)
	if File.exist?(file) == true
		File.delete(file)
	end
end

def write_to_file(filename, paragraph_counter, snippet)
	open(Rails.public_path.join("generated_subtitles/#{filename}.srt"), "a") do |f|
		f << paragraph_counter.to_s
		f << "\n"
		f << subtitle_time_range(snippet)
		f << snippet['alternatives'][0]['transcript']
		f << "\n\n"
	end
end

def subtitle_time_range(snippet)
	"#{convert_time(snippet['alternatives'][0]['timestamps'].first[1])},000 --> #{convert_time(snippet['alternatives'][0]['timestamps'].last[2])},000\n"
end
