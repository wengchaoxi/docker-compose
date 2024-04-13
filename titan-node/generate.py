from jinja2 import Environment, FileSystemLoader
import sys

env = Environment(loader=FileSystemLoader('.'))
template = env.get_template('generate_template.yml')

number_of_nodes = int(sys.argv[1]) if len(sys.argv) > 1 else 1

output = template.render(num=number_of_nodes)
with open('docker-compose.yml', 'w') as f:
    f.write(output)

print(f"[INFO] docker-compose.yaml file generated successfully ({number_of_nodes} nodes)")
