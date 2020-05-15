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
//Problem # 1:
Write a query to display the member id, member name of the members, book code and book title of the books taken by them.
select member_id,member_name from lms_members union select book_code, book_title from lms_book_details;

//Problem # 2:
Write a query to display the total number of books available in the library with alias name
“NO_OF_BOOKS_AVAILABLE” (Which is not issued). Hint: The issued books details are available in the
LMS_BOOK_ISSUE table.


select count(book_code) as No_of_books_available from lms_book_details
where BOOK_CODE not in
(select BOOK_CODE
from lms_book_issue where DATE_RETURNED is null);

//Problem # 3:
Write a query to display the member id, member name, fine range and fine amount of the members whose fine amount is less than 100.
select member_id,member_name from lms_members union select fine_range,fine_amount from lms_fine_details where fine_amount<100;

Problem # 4:
Write a query to display the book code, book title and availability status of the ‘JAVA’ books whose edition is 6. 
Show the availability status with alias name “AVAILABILITYSTATUS”. 
Hint: Book availability status can be fetched from “BOOK_ISSUE_STATUS” column of LMS_BOOK_ISSUE table.


select lms_book_details.book_title as AVAILABILITYSTATUS,category,lms_book_issue.book_code from 
lms_book_details join lms_book_issue on lms_book_details.book_code=lms_book_issue.book_code
where date_returned is not null and category='java' and book_edition='6';





select book_code,book_title from lms_book_details where 

//Problem # 5:
Write a query to display the book code, book title and rack number of the books which are placed in rack 'A1'
and sort by book title in ascending order.

select book_code,book_title,rack_num from lms_book_details where rack_num='a1' order by book_title asc;

Problem # 6:
Write a query to display the member id, member name, due date and date returned of the members who has
returned the books after the due date. Hint: Date_return is due date and Date_returned is actual book return date

select member_id,member_name 

Problem # 7:
Write a query to display the member id, member name and date of registration who have not taken any book.

select member_id,member_name,date_register from lms_members where date_register is null;

//Problem # 8:
Write a Query to display the member id and member name of the members who has not paid any fine in the year 2012.

select lms_members.member_name,lms_book_issue.member_id 
from lms_members join lms_book_issue on lms_members.member_id=lms_book_issue.member_id where fine_range is null and date_issue='2012-01-01';

Problem # 9:
Write a query to display the date on which the maximum numbers of books were issued and the number of
books issued with alias name “NOOFBOOKS”.

select max(date_issue) from lms_book_issue where 

//Problem # 10:
Write a query to list the book title and supplier id for the books authored by Herbert Schildt and the book

select lms_book_details.book_title,lms_suppliers_details.supplier_id from
lms_book_details join lms_suppliers_details on lms_book_details.supplier_id=lms_suppliers_details.supplier_id where author='herbert schildt';

