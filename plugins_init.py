import json
import os
import requests

from pathlib import Path

def main():
    config = read_json_config('plugins.json')
    plugins = config.get('plugins', [])
    module_configs = [generate_module_config(plugin) for plugin in plugins]
    append_module_configs(module_configs, 'main.tf')
    create_plugin_data_structure(plugins)
    clone_readme_file_in_plugin_data_structure(plugins)

def read_json_config(file_path):
    with open(file_path, 'r') as json_file:
        
        return json.load(json_file)

def generate_module_config(plugin):
    if "name" in plugin and "source" in plugin:
        
        return f'module "{plugin["name"]}" {{\n  source = "{plugin["source"]}"\n}}'
    
    return ''

def module_exists(module_name, file_path):
    with open(file_path, 'r') as tf_file:
        content = tf_file.read()
        
        return f'module "{module_name}"' in content

def append_module_configs(module_configs, file_path):
    with open(file_path, 'a') as tf_file:
        
        for config in module_configs:
            module_name = config.split('"')[1]
            
            if not module_exists(module_name, file_path):
                tf_file.write('\n\n' + config)

def create_plugin_data_structure(plugins):
    for plugin in plugins:
        path = Path(f'data/{plugin["name"]}')
        config_file_path = Path(f'data/{plugin["name"]}/{plugin["name"]}.json')

        if not os.path.exists(path):
            os.makedirs(path)

        if not os.path.exists(config_file_path):
            with open(config_file_path, 'w') as config_file:
                config_file.write('{}')

def clone_readme_file_in_plugin_data_structure(plugins):
    for plugin in plugins:
        source = plugin["source"].split('/')[-2:]
        url = compose_github_url(source)
        response = requests.get(url)

        with open(f'data/{plugin["name"]}/README.md', "w") as config_file:
            config_file.write(response.text)

def compose_github_url(source):
    base_url = "https://raw.githubusercontent.com/"
    org = source[0]
    module = source[1]
    default_branch = 'dev'
    return f'{base_url}{org}/{module}/{default_branch}/README.md'

if __name__ == "__main__":
    main()
