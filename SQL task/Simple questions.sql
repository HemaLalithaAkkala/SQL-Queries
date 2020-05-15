show tables;
use lms_db;
show tables;
select * from lms_book_details;
show tables;
use lms_db;
show tables;
select * from lms_suppliers_details;
select * from lms_book_details;
select * from lms_book_issue;
select * from lms_members;
select * from lms_fine_details;

Problem # 1:
Write a query to display the member id, member name, city and membership status who are all having life time membership. Hint: Life time membership status is “Permanent”.

select member_id,member_name,city,membership_status from lms_members where membership_status='permanent';

/*
Problem # 2:
Write a query to display the member id, member name who have not returned the books.
Write a query to display the member id, member name who have not returned on expected return date.
*/

select lms_members.member_name,lms_book_issue.member_id 
from lms_members join lms_book_issue on lms_members.member_id=lms_book_issue.member_id where date_return!=date_returned;


select lms_members.member_name,lms_book_issue.member_id 
from lms_members join lms_book_issue on lms_members.member_id=lms_book_issue.member_id where date_returned is null;


Problem # 3:
Write a query to display the member id, member name who have taken the book with book code 'BL000002'.
select lms_members.member_name,lms_book_issue.member_id 
from lms_members join lms_book_issue on lms_members.member_id=lms_book_issue.member_id where book_code='bl000002';

Problem # 4:
Write a query to display the book code, book title and author of the books whose author name begins with 'P'.
select book_code,book_title
from lms_book_details where author like 'p%';



Problem # 5:
Write a query to display the total number of Java books available in library with alias name ‘NO_OF_BOOKS’.
select book_code,count(category) as no_of_books from lms_book_details where category='java';

Problem # 6:
Write a query to list the category and number of books in each category with alias name ‘NO_OF_BOOKS’.
select category,count(category) as no_of_books from lms_book_details group by category;

Problem # 7:
Write a query to display the number of books published by Prentice Hall with the alias name “NO_OF_BOOKS”.
select count(book_code) as no_of_books from lms_book_details where publication='prentice hall';

Problem # 8:
Write a query to display the book code, book title of the books which are issued on the date "1st April 2012".
select lms_book_issue.book_code,lms_book_details.book_title 
from lms_book_issue join lms_book_details on lms_book_issue.book_code=lms_book_details.book_code where date_issue='2012-04-01';

Problem # 9:
Write a query to display the member id, member name, date of registration and expiry date of the members whose membership expiry date is before APR 2013.
select member_id,member_name,date_register,date_expire from lms_members where date_expire <'2013-04-01';

Problem # 10:
write a query to display the member id, member name, date of registration, membership status of the
members who registered before "March 2012" and membership status is "Temporary"

select member_id,member_name,date_register,membership_status from lms_members where date_register <'2012-03-01' and membership_status='temporary';


Problem #11:
Write a query to display the member id, member name who’s City is CHENNAI or DELHI. Hint: Display the
member name in title case with alias name 'Name'.

select member_id,member_name as Name,city from lms_members where city='chennai' or 'delhi';

Problem #12:
Write a query to concatenate book title, author and display in the following format.
Book_Title_is_written_by_Author
Example: Let Us C_is_written_by_Yashavant Kanetkar
Hint: display unique books. Use “BOOK_WRITTEN_BY” as alias name.

select distinct concat_ws("_","boook",book_title,"written","by",author) as BOOK_WRITTEN_BY from lms_book_details;

Problem #13:
Write a query to display the average price of books which is belonging to ‘JAVA’ category with alias name “AVERAGEPRICE”.
select avg(price) as AVERAGEPRICE from lms_book_details group by category='java';

Problem #14:
Write a query to display the supplier id, supplier name and email of the suppliers who are all having gmail account.
select supplier_id,supplier_name,email from lms_suppliers_details where email like '%gmail.com';

Problem#15:
Write a query to display the supplier id, supplier name and contact details. Contact details can be either phone
number or email or address with alias name “CONTACTDETAILS”. If phone number is null then display email,
even if email also null then display the address of the supplier. Hint: Use Coalesce function.

select supplier_id,supplier_name,coalesce(contact,email,address) as ContactDetails from lms_suppliers_details;

Problem#16:
Write a query to display the supplier id, supplier name and contact. If phone number is null then display ‘No’
else display ‘Yes’ with alias name “PHONENUMAVAILABLE”. Hint: Use NVL2.





