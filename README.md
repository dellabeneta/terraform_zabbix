# terraform_zabbix

Lab básico com subida de instância REDHAT EL9 já com o Zabbix instalado. Web Server, Agent e MySQL.
 
Ref.: https://www.zabbix.com/download?zabbix=6.2&os_distribution=red_hat_enterprise_linux&os_version=9&components=server_frontend_agent&db=mysql&ws=nginx
 
ATENÇÃO: instância utilizada do tipo t2.small, TEM CUSTO! Não indico usar uma t2.micro, 1GB de RAM é muito pouco para esse laboratório.
 
Vários secrets estão expostos, trata-se apenas de um Lab simples. Não faria sentido qualquer complexidade.
 
Se preferir expor o server em outra porta, que não a 80, descomente o arquivo "userdata.sh" nas linhas 13 e 14 removendo o #. Ficará disponível na 8080 - que também pode ser alterada para a porta de escolha.