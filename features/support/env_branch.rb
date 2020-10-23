
EL = YAML.load_file('./data/config/elm.yml')

if ENV['QA']
    DATA = YAML.load_file('./data/environments/luma/luma.yml')
end

