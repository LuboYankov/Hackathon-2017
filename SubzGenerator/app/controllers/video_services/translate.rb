require 'yaml'
require 'json'

def transform_lang(language)
	hash = YAML.load(File.read(Rails.root.to_s + "/app/controllers/video_services/config_lang.yml"))
	hash[language].to_s
end

def translatee(text, language)
	response = `curl -X POST -H "Content-type: application/json" -H "Authorization: LC apiKey=B9nsEIqZ6zrODSu%2BxPJw2A%3D%3D" -d '{"text": "#{text}", "from":"eng", "to":"#{transform_lang(language)}"}' https://lc-api.sdl.com/translate`
	JSON.parse(response)["translation"]
end
