# vantom
Vagrant setup to create Tomcats/httpd balancer playground

1. Clone repository

2. Edit Vagrant file and change "$total" variable to set appropriate count of tomcat servers

3. Run shell command to up and check servers:

  ./prep.sh&&vagrant up&&ansible-playbook tomcat.yml&&./build_nodes_list.sh&&ansible-playbook balancer.yml&&ansible-playbook tomcat_check.yml&&ansible-playbook balancer_check.yml&&ansible-playbook balancer_nodes.yml

4. Open and run jmeter-plan.yml in Apache JMeter

You can monitor some JMX parameters on the fly using html/index.html (index.html is a sample of jolokia js library usage).

