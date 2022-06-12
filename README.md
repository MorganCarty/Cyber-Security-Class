Project-One-ELK-Stack
Cybersecurity ELK Stack Project
---

## ELK-Stack-Project
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![vNet Diagram](https://github.com/MorganCarty/Cyber-Security-Class/blob/71cbdddba612f4021a2a7f955aaa23eff7b8e735/Diagrams/Project%201%20Network%20Diagram/Network%20Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

  - [install-elk.yml](https://github.com/MorganCarty/Cyber-Security-Class/blob/c529260a71124b71521f24eeb38a13e70d9512ed/Ansible/Ansible%20YAML%20Scripts/install-elk.yml)
  - [filebeat-config.yml](https://github.com/MorganCarty/Cyber-Security-Class/blob/c529260a71124b71521f24eeb38a13e70d9512ed/Ansible/Ansible%20YAML%20Scripts/filebeat-configuration.yml)
  - [filebeat-playbook.yml](https://github.com/MorganCarty/Cyber-Security-Class/blob/c529260a71124b71521f24eeb38a13e70d9512ed/Ansible/Ansible%20YAML%20Scripts/filebeat-playbook.yml)
  - [metricbeat-config.yml](https://github.com/MorganCarty/Cyber-Security-Class/blob/c529260a71124b71521f24eeb38a13e70d9512ed/Ansible/Ansible%20YAML%20Scripts/metricbeat-configuration.yml)
  - [metricbeat-playbook.yml](https://github.com/MorganCarty/Cyber-Security-Class/blob/c529260a71124b71521f24eeb38a13e70d9512ed/Ansible/Ansible%20YAML%20Scripts/metricbeat-playbook.yml)
  - [ansible_config.yml](https://github.com/MorganCarty/Cyber-Security-Class/blob/c529260a71124b71521f24eeb38a13e70d9512ed/Ansible/Ansible%20YAML%20Scripts/ansible-playbook.yml
)
 
This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build
 
### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network.

- What aspect of security do load balancers protect?
- A load balancer protects a network from DDOS (distributed denial-of-service) attacks and any traffic overload that may occur. The load balancer will do this by making sure that traffic is distributed evenly across all traffic lanes.

- What is the advantage of a jump box?
- The main advantage of a JumpBox is that it manages devices on a network that belong across different security zones. It acts as a controlled link between two trusted networks zones and provides a controlled way to access them. The JumpBox helps to improve security and also prevents all Azure VM’s from being exposed to the public.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems and system metrics.

What does Filebeat watch for?
- Filebeat, installed as an agent on your server, monitors log files or locations that have been specified, collects log events and sends the to either Elasticsearch or Logstash for indexing.

What does Metricbeat record?
- Metricbeat collects metrics from theh operating system or services running on the server. Once it has collected the metrics or statistics, it will then send the output to where the user specifys e.g. Elasticsearch or Logstash.

The configuration details of each machine may be found below.

 
| Name       | Function  |       IP Address        | Operating System |
|------------|-----------|-------------------------|------------------|
| Jump-Box   | Gateway   | 20.28.152.175; 10.0.0.4 | Linux Ubuntu     |
| Web-1      | Webserver | 10.0.0.5                | Linux Ubuntu     |
| Web-2      | Webserver | 10.0.0.6                | Linux Ubuntu     |
| ELKServer  | Kibana    | 20.227.138.89; 10.1.0.4 | Linux Ubuntu     |

### Access Policies
 
The machines on the internal network are not exposed to the public Internet.
 
Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 20.28.152.175.

Machines within the network can only be accessed by SSH.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_
- The JumpBox can connect to the ELK VM. Its IP Address is 20.28.152.175.

A summary of the access policies in place can be found in the table below.

 
| Name     | Publicly Accessible | Allowed IP Addresses    |
|----------|---------------------|-------------------------|
| Jump-Box | Yes                 | 20.28.152.175; 10.0.0.4 |
| ELKServer| No                  | 10.1.0.4                |
| DVWA 1   | No                  | 10.0.0.5                |
| DVWA 2   | No                  | 10.0.0.6                |

###Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- What is the main advantage of automating configuration with Ansible?
- The main advatage of Ansible, is that it allows you to install porgrams across multiple servers or devices by using only one playbook. This prevents a user from having to install the same program on each server or device individually (thus saving on time).

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._

-Once the install-elk playbook has been initiated, it will run through the below tasks:
- Installation of docker.io so that containers can be run.
- Installation of python3-pip so that the Phython software can be run.
- Installation of docker so that Ansible can control the state of docker containers.
- Increases the memory count to 262144 by using vm.max_map_count.
- Maps ports for the container to start with:
   -5601:5601
   -9200:9200
   -5044:5044

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
 
![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- List the IP addresses of the machines you are monitoring
  - Web 1 - 10.0.0.5
  - Web 2 - 10.0.0.6

We have installed the following Beats on these machines:
- Specify which Beats you successfully installed_
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
- Filebeat collects the system logs from each of the Web VMs and then sends them to Elasticsearch or Logstash. When using Elasticsearch or Logstash, the logs will show what files have been changed and when it took place. 
- Metricbeat collects all system and service statistics regarding the two Web VMs and also sends the information to Elasticsearch or Logstash. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-config.yml file to /etc/ansible/files/filebeat-config.yml.
- Update the filebeat-config.yml file to include host “10.1.0.4.9200” with username “elastic” and password “changeme” and setup.Kibana host to “10.1.0.4:5601”.
- Run the playbook, and navigate to Kibana to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook?
- filebeat-playbook.yml

- _Where do you copy it?_
- /etc/ansible/roles/filebeat.playbook.yml

- _Which file do you update to make Ansible run the playbook on a specific machine?
- filebeat-config.yml

- _How do I specify which machine to install the ELK server on versus which to install Filebeat on?
- For the ELK server to be installed on a machine, the private IP must first be added to the hosts file so that a connection can be established. The ELK servers IP was 10.1.0.4. After this the install-ELK.yml file will need to be updated by changing the hosts section. This specifies where to install the ELK server. Last of all the it must be specified that the ELK server is the host for Filebeat by modifying the filebeat-config.yml file. If this step is not done, then when the Filebeat playbook is run it will treat the ELK server as another device that needs Filebeat to be isntalled.

- _Which URL do you navigate to in order to check that the ELK server is running?
- http://20.227.138.89:5601/app/kibana

- As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.

First the user must connect to the Jump Box
- ssh RedAdmin@20.28.152.175 (User will need to connect to the Jump Box)
- sudo docker start container festive_tereshkova (User will need to start the container)
- sudo docker attach container festive_tereshkova (After starting the user will need to attach the container)

Before programs can be added to other systems/ devices, their IP addresses must be added to the hosts file.
- cd /etc/ansible (to navigate to the location of the hosts files)
- nano hosts (how to edit the hosts file and add the system/ device’s IP)
- Once the IP has been added to the hosts file, programs such as metric beat and filebeat can be installed across those systems/devices by running the playbook files.

Filebeat
- cd /etc/ansible/roles (navigate to the filebeat playbook and then run the below command)
- ansible-playbook filebeat-playbook.yml 

Metricbeat
- cd /etc/ansible/files (navigate to the metricbeat playbook and then run the below command)
- ansible-playbook metricbeat-playbook.yml

Once the programs have been installed, the user can obtain metrics from Kibana by opening a web browser and navigating to (http://[ELK-VM Public IP]:5601/app/kibana]. 
