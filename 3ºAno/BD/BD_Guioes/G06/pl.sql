--l) Para os t�tulos, obter o pre�o m�dio e o n�mero total de vendas agrupado por tipo
--(type) e editora (pub_id);

select type as tipo_livro, pub_name as editora, avg(titles.price) as media_pre�o, sum(ytd_sales) as total_vendas
from titles join publishers on titles.pub_id = publishers.pub_id
group by type, pub_name
having avg(titles.price) is not null;
