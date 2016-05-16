# vantom
Vagrant setup to create Tomcats/httpd balancer playground

1. Clone repository

2. Edit Vagrant file and edit "$total" variable to set appropriate count of tomcat servers

3. Run shell command to up and check servers

  ./prep.sh&&vagrant up&&ansible-playbook tomcat.yml&&./build_nodes_list.sh&&ansible-playbook balancer.yml&&ansible-playbook tomcat_check.yml&&ansible-playbook balancer_check.jmx&&ansible-playbook balancer_nodes.yml

4. Open and run jmeter-plan.yml in Apache JMeter

You can control some JMX parameters on the fly using html/index.html

