-- g) Nome das editoras que t�m pelo menos uma publica��o do tipo �Business�;
select distinct pub_name as nome_editora 
from publishers, titles
where type = 'Business'