use LIBRARY;
show tables;

SELECT
    a.au_id AS `AUTHOR ID`,
    a.au_lname AS `LAST NAME`,
    a.au_fname AS `FIRST NAME`,
    t.title AS `TITLE`,
    p.pub_name AS `PUBLISHER`
FROM
    authors AS a
INNER JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN
    titles AS t ON ta.title_id = t.title_id
INNER JOIN
    publishers AS p ON t.pub_id = p.pub_id
ORDER BY
    a.au_id, t.title;
    
SELECT
    a.au_id AS `AUTHOR ID`,
    a.au_lname AS `LAST NAME`,
    a.au_fname AS `FIRST NAME`,
    p.pub_name AS `PUBLISHER`,
    count(t.title) AS 'TITLE COUNT'
FROM
    authors AS a
INNER JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN
    titles AS t ON ta.title_id = t.title_id
INNER JOIN
    publishers AS p ON t.pub_id = p.pub_id
GROUP BY
	a.au_id, t.title, `PUBLISHER` 
ORDER BY
    a.au_id, t.title;
    
SELECT COUNT(*) AS `Total Records`
FROM titleauthor;

SELECT
	a.au_id as `AUTHOR ID`,
    a.au_lname as `LAST NAME`,
    a.au_fname as `FIRST NAME`,
    sum(s.qty) as `TOTAL`
FROM
    authors AS a
INNER JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN
    titles AS t ON ta.title_id = t.title_id
INNER JOIN
    sales AS s ON t.title_id = s.title_id
GROUP BY
	`AUTHOR ID`, `LAST NAME`, `FIRST NAME`
ORDER BY
    `TOTAL` DESC
LIMIT 3;

SELECT
	a.au_id as `AUTHOR ID`,
    a.au_lname as `LAST NAME`,
    a.au_fname as `FIRST NAME`,
    sum(ifnull(s.qty, 0)) as `TOTAL`
FROM
    authors AS a
INNER JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN
    titles AS t ON ta.title_id = t.title_id
INNER JOIN
    sales AS s ON t.title_id = s.title_id
GROUP BY
	`AUTHOR ID`, `LAST NAME`, `FIRST NAME`
ORDER BY
    `TOTAL` DESC;
