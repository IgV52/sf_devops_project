import json

with open('terraform.tfstate', 'r') as f:
    templates = json.load(f)

resources = templates.get('resources')

ips = {}

for res in range(len(resources)):
    try:
        ips[resources[res].get('instances')[0].get('attributes').get('name')] = resources[res].get('instances')[0].get('attributes').get('network_interface')[0].get('nat_ip_address')
    except Exception as e:
        pass

srv_hosts = '\n'.join(v for k,v in ips.items() if "srv" == k[:3])
master_hosts = '\n'.join(v for k,v in ips.items() if "master" == k[:6])
app_hosts = '\n'.join(v for k,v in ips.items() if "app" == k[:3])

with open('../ansible/inventory/servers.yaml', 'w') as f:

    f.write(
        f'all:\n'
        f'  children:\n'
        f'    k8s_master:\n'
        f'      hosts:\n'
        f'        {master_hosts}\n'
        f'    k8s_app:\n'
        f'      hosts:\n'
        f'        {app_hosts}\n'
        f'    srv:\n'
        f'      hosts:\n'
        f'        {srv_hosts}\n')